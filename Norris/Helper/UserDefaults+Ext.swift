//
//  UserDefaults+Ext.swift
//  Norris
//
//  Created by Bárbara Souza on 16/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case categories = "CATEGORIES"
    case suggestions = "SUGGESTIONS"
}

extension UserDefaults {
    class func getValue(key: UserDefaultsKeys) -> [String]? {
        return UserDefaults.standard.stringArray(forKey: key.rawValue)
    }
    
    class func setValue(key: UserDefaultsKeys, value: [String]) {
        return UserDefaults.standard.set(value, forKey: key.rawValue)
    }
}
