//
//  NorrisStrings.swift
//  Norris
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

class NorrisStrings {
    private static var tableName = "NorrisStrings"
    
    static func localized(for key: String) -> String {
        let bundle = Bundle(for: NorrisStrings.self)
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: "", comment: "")
    }
    
    static let uncategorized = localized(for: "uncategorized")
    static let appName = localized(for: "appName")
}
