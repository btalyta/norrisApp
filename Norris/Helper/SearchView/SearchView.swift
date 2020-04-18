//
//  SearchView.swift
//  Norris
//
//  Created by Bárbara Souza on 15/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class SearchView: UIView {
    var didTapSuggestion: ((_ index: IndexPath) -> Void)?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        layout.itemSize = CGSize(width: 100, height: 30)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        collection.register(SearchHeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: SearchHeaderView.identifier)
        collection.backgroundColor = NorrisColors.baseColor
        return collection
    }()
    
    private var dataSource = SearchDataSource()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        addConstraints()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize = CGSize(width: bounds.width, height: 40)

    }
    
    private func setupView() {
        addSubview(collectionView)
    }
    
    private func addConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.safeRightAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.safeLeftAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addActions() {
        dataSource.didTapSuggestions = { [weak self] index in
            self?.didTapSuggestion?(index)
        }
    }
    
    private func setupDataSource() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }
    
    func show(viewModel: [SearchViewModel]) {
        dataSource.update(items: viewModel)
        setupDataSource()
    }
}
