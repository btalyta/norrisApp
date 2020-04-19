//
//  FactsRepository.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

class FactsRepository: FactsRepositoryProtocols {
    private let network: HttpRequestProtocol
    private let coreDataManager: CoreDataManagerProtocol
    
    init(network: HttpRequestProtocol = HttpRequest.shared,
         coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.network = network
        self.coreDataManager = coreDataManager
    }
    
    func requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void)) {
        let history = UserDefaults.getValue(key: .suggestions) ?? []
        if let categories = UserDefaults.getValue(key: .categories) {
             completion(.success(SuggestionsModel(categories: categories, history: history)))
            return
        }
        
        let endpoint = CategoriesEndpoint()
        network.request([String].self, from: endpoint) { result in
            switch result {
            case.success(let data):
                completion(.success(SuggestionsModel(categories: data, history: history)))
            case .failure(let serviceError):
                guard let error = serviceError as? APIError else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                completion(.failure(error))
            }
        }
    }
    
    func requestFact(with category: String, completion: @escaping ((Result<FactModel, APIError>) -> Void)) {
        let endpoint = FactsEndpoint.categories(category: category)
        network.request(FactModel.self, from: endpoint) { [weak self] result in
            switch result {
            case.success(let data):
                completion(.success(data))
                self?.coreDataManager.updateFacts(models: [data], tag: nil)
            case .failure(let serviceError):
                self?.requestLocalFact(with: category,
                                       error: serviceError,
                                       completion: completion)
            }
        }
    }
    
    func requestCollection(with text: String,
                           completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void)) {
        let endpoint = FactsEndpoint.text(text: text)
        network.request(FactsCollectionModel.self, from: endpoint) { [weak self] result in
            switch result {
            case.success(let data):
                completion(.success(data))
                self?.coreDataManager.updateFacts(models: data.result, tag: text)
            case .failure(let serviceError):
                self?.requestCollection(with: text,
                                        error: serviceError,
                                        completion: completion)
            }
        }
    }
    
    private func requestLocalFact(with category: String, error: Error,
                                  completion: @escaping ((Result<FactModel, APIError>) -> Void)) {
        if let result = coreDataManager.fetchCategory(with: category).first {
            completion(.success(result))
            return
        }
        
        guard let error = error as? APIError else {
            completion(.failure(APIError.invalidData))
            return
        }
        completion(.failure(error))
    }
    
    private func requestCollection(with text: String, error: Error,
                                   completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void)) {
        let result = coreDataManager.fetchFacts(with: text)
        if result.count > 1 {
            completion(.success(FactsCollectionModel(result: result)))
            return
        }
        
        guard let error = error as? APIError else {
            completion(.failure(APIError.invalidData))
            return
        }
        completion(.failure(error))
    }
    
    func reuestLocalFacts(with total: Int) -> [FactModel] {
        return coreDataManager.fetchFacts(with: total)
    }
}
