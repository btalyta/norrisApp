//
//  FactsPresenter.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

class FactsPresenter: FactsPresenterProtocol {
    weak var viewController: FactsViewControllerProtocol?
    private var repository: FactsRepositoryProtocols
    private var categories: CategoriesModel
    private var model: [FactModel] {
        didSet {
            let viewModel = adapt(model: model)
            viewController?.showFacts(viewModel: viewModel)
        }
    }
    
    init(repository: FactsRepositoryProtocols = FactsRepository()) {
        self.repository = repository
        self.model = []
        self.categories = CategoriesModel(categories: [])
    }
    
    func viewDidLoad() {
        requestCategories()
    }
    
    func didSelectCard(with index: IndexPath) {
        viewController?.wantsToShare(url: model[index.row].url)
    }
    
    func wantsToSearch(category: String) {
        requestFact(witn: category)
    }
    
    func wantsToSearch(text: String) {
        requestCollection(witn: text)
    }
    
    private func requestCategories() {
        repository.requestCategories { [weak self] result in
            switch result {
            case .success(let models):
                self?.categories = models
            default:
                break
            }
        }
    }
    
    private func adapt(model: [FactModel]) -> FactsViewModel {
        let viewModel =  model.map {
            return FactCellViewModel(fact: $0.value,
                                     tag: $0.categories?.first ?? NorrisStrings.uncategorized)
        }
        return FactsViewModel(cells: viewModel)
    }
    
    private func requestCollection(witn text: String) {
        repository.requestCollection(with: text) { [weak self] result in
            switch result {
            case .success(let data):
                self?.model = data.result
            case .failure:
                self?.viewController?.showError()
            }
        }
    }
    
    private func requestFact(witn category: String) {
        repository.requestFact(with: category) { [weak self] result in
            switch result {
            case .success(let data):
                self?.model = [data]
            case .failure:
                self?.viewController?.showError()
            }
        }
    }
}
