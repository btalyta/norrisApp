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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeRightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.safeLeftAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupDataSource() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
    }
    
    func show(viewModel: FactsViewModel) {
        dataSource.update(items: viewModel.cells)
        setupDataSource()
    }
}
