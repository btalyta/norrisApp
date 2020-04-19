//
//  FactCellViewModelFactory.swift
//  NorrisUITests
//
//  Created by Bárbara Souza on 19/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

@testable import Norris

struct FactCellViewModelFactory {
    static func build() -> [FactCellViewModel] {
        return [
            FactCellViewModel(fact: "Chuck Norris believes that Shanimal rocks", tag: "UNCATEGORIZED"),
            FactCellViewModel(fact: "Chuck Norris was attacked by a vicious pit bull and it ended up with a trip to the hospital. The Vet.",
                              tag: "Other"),
            FactCellViewModel(fact: "Some people can make animal shapes out of balloons. Chuck Norris can do the same with human organs.",
                              tag: "UNCATEGORIZED"),
            FactCellViewModel(fact: "Darwins theory of evoloution ape animal caveman human Chuck Norris",
                              tag: "Animal")
        ]
    }
}
