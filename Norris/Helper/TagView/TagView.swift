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
        label.textColor = NorrisColors.tagTextColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    init(frame: CGRect = .zero, font: UIFont? = NorrisFonts.tagFont) {
        super.init(frame: frame)
        title.font = font
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        accessibilityLabel = "tag_view"
        backgroundColor = NorrisColors.tagColor
        
        addSubview(title)
    }
    
    private func addConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func show(title: String) {
        self.title.text = title
    }
}
