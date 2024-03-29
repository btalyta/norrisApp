//
//  FactsRepositoryTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Cuckoo

@testable import Norris

class FactsRepositoryTests: QuickSpec {
    override func spec() {
        var sut: FactsRepository!
        var networkMock: HttpRequestProtocolMock!
        var coreDataManagerMock: MockCoreDataManagerProtocol!
        
        beforeEach {
            networkMock = HttpRequestProtocolMock()
            coreDataManagerMock = MockCoreDataManagerProtocol()
            sut = FactsRepository(network: networkMock,
                                  coreDataManager: coreDataManagerMock)
            stub(coreDataManagerMock) { stub in
                when(stub.fetchFacts(with: anyInt())).thenReturn([])
            }
        }
        
        describe("#requestSuggestions") {
            context("when there is no data storange") {
                beforeEach {
                    let defaults = UserDefaults.standard
                    defaults.removeObject(forKey: UserDefaultsKeys.categories.rawValue)
                }
                it("endPoint is CategoriesEndpoint and calls network request") {
                    sut.requestSuggestions { _ in }
                    expect(networkMock.requestWasCalled).to(beTrue())
                    expect(networkMock.endpoint).to(beAKindOf(CategoriesEndpoint.self))
                }
            }
            context("when there is data storange") {
                beforeEach {
                    UserDefaults.setValue(key: UserDefaultsKeys.categories,
                                          value: SuggestionsModelFactory().build().categories)
                }
                it("endPoint is nil and doesn't call network request") {
                    sut.requestSuggestions { _ in }
                    expect(networkMock.requestWasCalled).to(beFalse())
                    expect(networkMock.endpoint).to(beNil())
                }
            }
        }
        
        describe("#requestFact") {
            it("endPoint is FactsEndpoint and calls network request") {
                sut.requestFact(with: "") { _ in }
                expect(networkMock.requestWasCalled).to(beTrue())
                expect(networkMock.endpoint).to(beAKindOf(FactsEndpoint.self))
            }
        }
        
        describe("#requestCollection") {
            it("endPoint is FactsEndpoint and calls network request") {
                sut.requestCollection(with: "") { _ in }
                expect(networkMock.requestWasCalled).to(beTrue())
                expect(networkMock.endpoint).to(beAKindOf(FactsEndpoint.self))
            }
        }
        
        describe("requestLocalFacts") {
            it("calls coreDataManagerMock ") {
                sut.requestLocalFacts(with: 10) { _ in }
                verify(coreDataManagerMock).fetchFacts(with: 10)
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
