//
//  FactView.swift
//  Norris
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class FactsView: UIView {
    var didTapShareButton: ((_ index: IndexPath) -> Void)?
    
    private let loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.color = NorrisColors.baseColor
        view.style = .large
        return view
    }()
    
    private var tableView: UITableView = {
        let view = UITableView()
        view.register(FactCell.self, forCellReuseIdentifier: FactCell.identifier)
        return view
    }()
    
    private var dataSource = FactsDataSource()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        addConstraints()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = NorrisColors.tagTextColor
        addSubview(tableView)
        addSubview(loadingView)
        loadingView.isHidden = true
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeRightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.safeLeftAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        let loadingViewConstraints = [
            loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(loadingViewConstraints)
    }
    
    private func addActions() {
        dataSource.didTapShareButton = { [weak self] index in
            self?.didTapShareButton?(index)
        }
    }
    
    private func setupDataSource() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
    }
    
    func show(viewModel: FactsViewModel) {
        tableView.isHidden = viewModel.isLoading
        loadingView.isHidden = !viewModel.isLoading
        
        if viewModel.isLoading {
            loadingView.startAnimating()
            return
        }
        
        dataSource.update(items: viewModel.cells)
        setupDataSource()
    }
}
