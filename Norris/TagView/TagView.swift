//
//  TagView.swift
//  Norris
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class TagView: UIView {
    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = NorrisFonts.tagFont
        label.textColor = .white
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
        layer.cornerRadius = 8
        backgroundColor = NorrisColors.tagColor
        
        addSubview(title)
    }
    
    private func addConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func show(title: String) {
        self.title.text = title
    }
}
