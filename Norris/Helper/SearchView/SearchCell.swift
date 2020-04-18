//
//  SearchCell.swift
//  Norris
//
//  Created by Bárbara Souza on 15/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    private (set) static var identifier = "SearchView"
    private let suggestionView = TagView(font: NorrisFonts.suggestionFont)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(suggestionView)
    }
    
    private func addConstraints() {
        suggestionView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            suggestionView.topAnchor.constraint(equalTo: self.topAnchor),
            suggestionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            suggestionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            suggestionView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func show(suggestion: String) {
        suggestionView.show(title: suggestion)
    }
}
