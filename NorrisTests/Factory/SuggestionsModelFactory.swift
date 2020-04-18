//
//  SuggestionsModelFactory.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

@testable import Norris

class SuggestionsModelFactory {
    let categoriesList = ["animal", "travel", "fashion", "food", "money", "sport", "religion", "colors"]
    let historyList = ["travel", "sport", "show"]
    
    func build() -> SuggestionsModel {
        return SuggestionsModel(categories: categoriesList,
                                history: historyList)
    }
    
    func build(categories: Int) -> SuggestionsModel {
        var list: [String] = []
        
        for index in 0 ..< categories {
            list.append(categoriesList[index%8])
        }
        return SuggestionsModel(categories: list,
                                history: historyList)
    }
}
