//
//  CoreDataManagerProtocol.swift
//  Norris
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

protocol CoreDataManagerProtocol: class {
    func updateFacts(models: [FactModel], tag: String?)
    func fetchFacts(with text: String) -> [FactModel]
    func fetchCategory(with category: String) -> [FactModel]
    func fetchFacts(with total: Int) -> [FactModel]
}
