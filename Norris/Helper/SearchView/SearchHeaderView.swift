//
//  SearchHeaderView.swift
//  Norris
//
//  Created by Bárbara Souza on 15/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class SearchHeaderView: UICollectionReusableView {
    private (set) static var identifier = "SearchHeaderView"
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = NorrisFonts.suggestionHeaderFont
        label.textColor = NorrisColors.tagTextColor
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(title)
    }
    
    private func addConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func show(title: String) {
        self.title.text = title
    }
}
