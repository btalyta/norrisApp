//
//  FactDataSource.swift
//  Norris
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class FactsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var didTapShareButton: ((_ index: IndexPath) -> Void)?
    private var items: [FactCellViewModel]
    
    init(items: [FactCellViewModel] = []) {
        self.items = items
    }
    
    func update(items: [FactCellViewModel]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FactCell.identifier, for: indexPath) as? FactCell else {
            return UITableViewCell()
        }
        
        cell.show(viewModel: items[indexPath.row], index: indexPath)
        cell.didTapShareButton = { [weak self] index in
            self?.didTapShareButton?(index)
        }
        
        return cell
    }
}
