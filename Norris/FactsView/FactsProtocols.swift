//
//  FactsProtocols.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

protocol FactsRepositoryProtocols {
    func requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))
    func requestFact(with category: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))
    func requestCollection(with text: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))
}

protocol FactsPresenterProtocol: class {
    var viewController: FactsViewControllerProtocol? { get set}
    func viewDidLoad()
    func didSelectCard(with index: IndexPath)
    func wantsToSearch(with index: IndexPath)
    func wantsToSearch(text: String)
    func wantsToShowSuggestions()
}

protocol FactsViewControllerProtocol: class {
    func showFacts(viewModel: FactsViewModel)
    func showError()
    func wantsToShare(url: String)
    func showSuggestions(viewModel: [SearchViewModel])
}
