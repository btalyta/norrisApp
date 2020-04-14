//
//  APIError.swift
//  Norris
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

enum APIError: Error, Equatable {
    case jsonConversionFailure
    case invalidData
    case timeout
    case unauthorized
    case server
    case request
    case decode
    
    var localizedDescription: String {
        switch self {
        case .invalidData:
            return "Invalid data."
        case .timeout:
            return "Connection error."
        case .unauthorized:
            return "Unauthorized."
        case .jsonConversionFailure:
            return "JSON conversion failure."
        case .server:
            return "Unavailable service."
        case .request:
            return "Invalid request."
        case .decode:
            return "Invalid decoding data"
        }
    }
}
