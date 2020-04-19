//
//  ErrorView.swift
//  Norris
//
//  Created by Bárbara Souza on 19/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = NorrisImages.errorIcon
        view.tintColor = NorrisColors.errorColor
        view.contentMode = .scaleAspectFit
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = NorrisStrings.errorTitle
        label.font = NorrisFonts.titleFont
        label.textColor = NorrisColors.factTextColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.font = NorrisFonts.factFont
        label.textColor = NorrisColors.factTextColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = NorrisColors.tagTextColor
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(infoLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let imageViewConstraints = [
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        let infoLabelConstraints = [
            infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(infoLabelConstraints)
        
    }
       
    func show(error: String) {
        infoLabel.text = error
    }
}
