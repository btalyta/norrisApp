//
//  SearchDataSource.swift
//  Norris
//
//  Created by Bárbara Souza on 15/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {    
    
    var didTapSuggestions: ((_ index: IndexPath) -> Void)?
    private var items: [SearchViewModel]
    
    init(items: [SearchViewModel] = []) {
        self.items = items
    }
    
    func update(items: [SearchViewModel]) {
        self.items = items
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SearchHeaderView.identifier,
                                                                         for: indexPath) as? SearchHeaderView
            header?.show(title: items[indexPath.section].title)
            return header ?? UICollectionReusableView()
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UICollectionViewCell()
        }
        cell.show(suggestion: items[indexPath.section].suggestions[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapSuggestions?(indexPath)
    }
}
