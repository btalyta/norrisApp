//
//  FactCell.swift
//  Norris
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class FactCell: UITableViewCell {
    var didTapShareButton: ((_ index: IndexPath) -> Void)?
    var maxCharacters: Int = 80
    private (set) static var identifier = "FactCell"
    private var indexPath: IndexPath?
    
    private let factLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = NorrisColors.factTextColor
        return label
    }()
    
    private let tagView = TagView()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(NorrisImages.shareIcon, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        addConstraints()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        selectionStyle = .none
        contentView.addSubview(factLabel)
        contentView.addSubview(tagView)
        contentView.addSubview(shareButton)
    }
    
    private func addConstraints() {
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        tagView.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        let factLabelConstraints = [
            factLabel.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 12),
            factLabel.bottomAnchor.constraint(equalTo: tagView.topAnchor, constant: -16),
            factLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            factLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ]
                
        let tagViewConstraints = [
            tagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            tagView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8)
        ]
        
        let sharedButtonConstraints = [
            shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            shareButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        NSLayoutConstraint.activate(factLabelConstraints)
        NSLayoutConstraint.activate(tagViewConstraints)
        NSLayoutConstraint.activate(sharedButtonConstraints)
    }
    
    private func addActions() {
        shareButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        if let index = indexPath {
            didTapShareButton?(index)
        }
    }
    
    func show(viewModel: FactCellViewModel, index: IndexPath) {
        tagView.show(title: viewModel.tag)
        factLabel.attributedText = viewModel.fact.addLineSpace(7)
        factLabel.font = viewModel.fact.count > maxCharacters ? NorrisFonts.factSmallFont : NorrisFonts.factFont
        indexPath = index
    }
}
