//
//  ViewController.swift
//  Norris
//
//  Created by Bárbara Souza on 10/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController, FactsViewControllerProtocol {
    
    private let presenter: FactsPresenterProtocol
    private let contentView: FactsView
    private let searchController = UISearchController(searchResultsController: nil)
    private let suggestionsView: SearchView
    
    init(presenter: FactsPresenterProtocol = FactsPresenter(),
         contentView: FactsView = FactsView(),
         suggestionsView: SearchView = SearchView()) {
        self.presenter = presenter
        self.contentView = contentView
        self.suggestionsView = suggestionsView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addConstraints()
        bindActions()
        
        presenter.viewDidLoad()
        title = NorrisStrings.appName
        configureSearchController()
    }
    
    private func setupView() {
        view.addSubview(suggestionsView)
        suggestionsView.alpha = 0
    }
    
    private func addConstraints() {
        suggestionsView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            suggestionsView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            suggestionsView.rightAnchor.constraint(equalTo: view.safeRightAnchor),
            suggestionsView.leftAnchor.constraint(equalTo: view.safeLeftAnchor),
            suggestionsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func bindActions() {
        contentView.didTapShareButton = { [weak self] index in
            self?.presenter.didSelectCard(with: index)
        }
        
        suggestionsView.didTapSuggestion = { [weak self] index in
            self?.presenter.wantsToSearch(with: index)
            self?.showSuggestionView(false)
            self?.searchController.isActive = false
        }
    }
    
    private func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = NorrisStrings.search
        searchController.searchBar.barStyle = .default
        searchController.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func showFacts(viewModel: FactsViewModel) {
        contentView.show(viewModel: viewModel)
    }
    
    func wantsToShare(url: String) {
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showError() {
        // TODO: Add Error view
    }
    
    func showSuggestions(viewModel: [SearchViewModel]) {
        showSuggestionView(true)
        suggestionsView.show(viewModel: viewModel)
    }

    func showSuggestionView(_ show: Bool) {
        let alpha: CGFloat = show ? 1.0 : 0.0
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: { [weak self] in
            self?.suggestionsView.alpha = alpha
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
}

extension FactsViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            presenter.wantsToSearch(text: text)
        }
        showSuggestionView(false)
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        showSuggestionView(false)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter.wantsToShowSuggestions()
    }
}
