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
    private let searchController: UISearchController
    private let suggestionsView: SearchView
    private let errorView: ErrorView
    
    init(presenter: FactsPresenterProtocol = FactsPresenter(),
         contentView: FactsView = FactsView(),
         suggestionsView: SearchView = SearchView(),
         errorView: ErrorView = ErrorView(),
         searchController: UISearchController = UISearchController(searchResultsController: nil)) {
        self.presenter = presenter
        self.contentView = contentView
        self.suggestionsView = suggestionsView
        self.searchController = searchController
        self.errorView = errorView
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
        view.addSubview(errorView)
        view.addSubview(suggestionsView)
        suggestionsView.alpha = 0
        errorView.isHidden = true
    }
    
    private func addConstraints() {
        suggestionsView.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false
        
        let suggestionsViewConstraints = [
            suggestionsView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            suggestionsView.rightAnchor.constraint(equalTo: view.safeRightAnchor),
            suggestionsView.leftAnchor.constraint(equalTo: view.safeLeftAnchor),
            suggestionsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ]
        NSLayoutConstraint.activate(suggestionsViewConstraints)
        
        let errorViewConstraints = [
            errorView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            errorView.rightAnchor.constraint(equalTo: view.safeRightAnchor),
            errorView.leftAnchor.constraint(equalTo: view.safeLeftAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
        ]
        NSLayoutConstraint.activate(errorViewConstraints)
    }
    
    private func bindActions() {
        contentView.didTapShareButton = { [weak self] index in
            self?.presenter.didSelectCard(with: index)
        }
        
        suggestionsView.didTapSuggestion = { [weak self] index in
            self?.presenter.wantsToSearch(with: index)
            self?.showSuggestionView(false)
            self?.searchController.isActive = false
            self?.errorView.isHidden = true
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
    
    func showError(message: String) {
        errorView.show(error: message)
        errorView.isHidden = false
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
        errorView.isHidden = true
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        showSuggestionView(false)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter.wantsToShowSuggestions()
    }
}
