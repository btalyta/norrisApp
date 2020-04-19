//
//  FactsCollectionModel.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

struct FactsCollectionModel: Decodable, Equatable {
    let result: [FactModel]
}
