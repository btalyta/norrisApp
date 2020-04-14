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
    
    init(network: HttpRequestProtocol = HttpRequest.shared) {
        self.network = network
    }
    
    func requestCategories(completion: @escaping ((Result<CategoriesModel, APIError>) -> Void)) {
        let endpoint = CategoriesEndpoint()
        network.request([String].self, from: endpoint) { result in
            switch result {
            case.success(let data):
                completion(.success(CategoriesModel(categories: data)))
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
        network.request(FactModel.self, from: endpoint) { result in
            switch result {
            case.success(let data):
                completion(.success(data))
            case .failure(let serviceError):
                guard let error = serviceError as? APIError else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                completion(.failure(error))
            }
        }
    }
    
    func requestCollection(with text: String,
                           completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void)) {
        let endpoint = FactsEndpoint.text(text: text)
        network.request(FactsCollectionModel.self, from: endpoint) { result in
            switch result {
            case.success(let data):
                completion(.success(data))
            case .failure(let serviceError):
                guard let error = serviceError as? APIError else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                completion(.failure(error))
            }
        }
    }
}
