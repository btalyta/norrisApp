//
//  CategoriesEndpoint.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

struct CategoriesEndpoint: Endpoint {
    var url: String {
        return "https://api.chucknorris.io/jokes/categories"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: [String: String] = [:]
}
