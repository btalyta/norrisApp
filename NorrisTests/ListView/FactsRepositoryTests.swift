//
//  FactsRepositoryTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class FactsRepositoryTests: QuickSpec {
    override func spec() {
        var sut: FactsRepository!
        var networkMock: HttpRequestProtocolMock!
        
        beforeEach {
            networkMock = HttpRequestProtocolMock()
            sut = FactsRepository(network: networkMock)
        }
        
        describe("#requestCategories") {
            it("endPoint is CategoriesEndpoint") {
                sut.requestCategories { _ in }
                expect(networkMock.requestWasCalled).to(beTrue())
                expect(networkMock.endpoint).to(beAKindOf(CategoriesEndpoint.self))
            }
        }
        
        describe("#requestFact") {
            it("endPoint is FactsEndpoint") {
                sut.requestFact(with: "") { _ in }
                expect(networkMock.requestWasCalled).to(beTrue())
                expect(networkMock.endpoint).to(beAKindOf(FactsEndpoint.self))
            }
        }
        
        describe("#requestCollection") {
            it("endPoint is FactsEndpoint") {
                sut.requestCollection(with: "") { _ in }
                expect(networkMock.requestWasCalled).to(beTrue())
                expect(networkMock.endpoint).to(beAKindOf(FactsEndpoint.self))
            }
        }
    }
}

class HttpRequestProtocolMock: HttpRequestProtocol {
    var requestWasCalled = false
    var endpoint: Endpoint?
    
    func request<T>(_ type: T.Type, from endpoint: Endpoint,
                    completion: ((Result<T, Error>) -> Void)?) {
        requestWasCalled = true
        self.endpoint = endpoint
    }
}
