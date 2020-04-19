//
//  FactModel.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

struct FactModel: Equatable, Decodable {
    let url: String
    let value: String
    let categories: [String]?
}
