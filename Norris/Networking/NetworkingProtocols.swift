//
//  NetworkingProtocols.swift
//  Norris
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

protocol HttpRequestProtocol {
    func request<T: Decodable>(_ type: T.Type,
                               from endpoint: Endpoint,
                               completion: ((Result<T, Error>) -> Void)?)
}

protocol Endpoint {
    var url: String { get }
    var method: RequestMethod { get }
    var body: Data? { get }
    var headers: [String: String] { get }
}

protocol HttpClientProtocol {
    func request(_ endpoint: Endpoint,
                 completion: ((Result<Data, Error>) -> Void)?)

}
