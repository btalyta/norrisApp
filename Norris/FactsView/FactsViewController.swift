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
    
    init(presenter: FactsPresenterProtocol = FactsPresenter(),
         contentView: FactsView = FactsView()) {
        self.presenter = presenter
        self.contentView = contentView
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
        bindActions()
        presenter.viewDidLoad()
    }
    
    private func bindActions() {
        contentView.didTapShareButton = { [weak self] index in
            self?.presenter.didSelectCard(with: index)
        }
    }
    
    func showFacts(viewModel: FactsViewModel) {
        contentView.show(viewModel: viewModel)
    }
    
    func wantsToShare(url: String) {
        // TODO: Add share
    }
    
    func showError() {
        // TODO: Add Error view
    }

}
