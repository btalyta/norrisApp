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
    private (set) var suggestions: [SearchViewModel]
    private var model: [FactModel] {
        didSet {
            let viewModel = adapt(model: model)
            viewController?.showFacts(viewModel: viewModel)
        }
    }
    
    init(repository: FactsRepositoryProtocols = FactsRepository()) {
        self.repository = repository
        self.model = []
        self.suggestions = []
    }
    
    func viewDidLoad() {
        requestSuggestions()
        loadLoacalFacts()
    }
    
    func didSelectCard(with index: IndexPath) {
        viewController?.wantsToShare(url: model[index.row].url)
    }
    
    func wantsToSearch(with index: IndexPath) {
        if index.section == 0 {
            requestFact(witn: suggestions[index.section].suggestions[index.row])
            return
        }
        requestCollection(witn: suggestions[index.section].suggestions[index.row])
    }
    
    func wantsToSearch(text: String) {
        requestCollection(witn: text)
        addHistory(text: text)
    }
    
    func wantsToShowSuggestions() {
        viewController?.showSuggestions(viewModel: suggestions)
    }
    
    private func requestSuggestions() {
        repository.requestSuggestions { [weak self] result in
            switch result {
            case .success(let model):
                self?.suggestionsHandler(with: model)
            default:
                break
            }
        }
    }
    
    private func loadLoacalFacts() {
        repository.requestLocalFacts(with: 10) { [weak self] result in
            self?.model = result
        }
    }
    
    private func suggestionsHandler(with data: SuggestionsModel) {
        var categories = data.categories
        if categories.count > 8 {
            categories.shuffle()
            categories = Array(categories.prefix(8))
            UserDefaults.setValue(key: .categories, value: categories)
        }
        
        suggestions.append(SearchViewModel(title: NorrisStrings.categories,
                                           suggestions: categories))
        suggestions.append(SearchViewModel(title: NorrisStrings.history,
                                           suggestions: data.history))
    }
    
    private func addHistory(text: String) {
        if suggestions.count < 2 { return }
        if suggestions[1].suggestions.contains(text.lowercased()) {
            return
        }
        suggestions[1].suggestions.insert(text.lowercased(), at: 0)
        UserDefaults.setValue(key: .suggestions, value: suggestions[1].suggestions)
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
