//
//  FactsEndpoint.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

enum FactsEndpoint {
    case categories(category: String)
    case text(text: String)
}

extension FactsEndpoint: Endpoint {
    var url: String {
        switch self {
        case .categories(let category):
            return "https://api.chucknorris.io/jokes/random?category=\(category)"
        case .text(let text):
            return "https://api.chucknorris.io/jokes/search?query=\(text)"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: [String: String] {
        return [:]
    }
}
