//
//  HttpRequest.swift
//  Norris
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Foundation

class HttpRequest: HttpRequestProtocol {
    
    static var shared: HttpRequestProtocol = HttpRequest()
    private let http: HttpClientProtocol
    private var decoder: JSONDecoder

    init(decoder: JSONDecoder = JSONDecoder(), http: HttpClientProtocol = HttpClient()) {
        self.http = http
        self.decoder = decoder
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func request<T: Decodable>(_ type: T.Type,
                               from endpoint: Endpoint,
                               completion: ((Result<T, Error>) -> Void)?) {

        http.request(endpoint) { dataResult in
            DispatchQueue.main.async {
                switch dataResult {
                case .failure(let error):
                    completion?(.failure(error))
                    
                case .success(let data):
                    do {
                        let decodedObject = try self.decoder.decode(type, from: data)
                        completion?(.success(decodedObject))
                    } catch {
                        completion?(.failure(APIError.decode))
                    }
                }
            }
        }
    }
}
