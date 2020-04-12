//
//  HttpRequestTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Cuckoo

@testable import Norris

class HttpRequestTests: QuickSpec {
    override func spec() {
        var sut: HttpRequest!
        var httpClientMock: MockHttpClientProtocol!
        
        beforeEach {
            httpClientMock = MockHttpClientProtocol()
            sut = HttpRequest(http: httpClientMock)
        }
        
        describe("request") {
            context("when the request is successful") {
                it("returns correct data") {
                    makeStub()
                    sut.request([String: [String]].self, from: EndpointMock()) { result in
                        switch result {
                        case.success(let data):
                            expect(data).to(equal(["names": ["Bob", "Tim", "Tina"]]))
                        case .failure:
                            fail("Unexpected result")
                        }
                    }
                }
            }
            
            context("when the request is fails") {
                it("retuns an error ") {
                    makeStub(with: false)
                    sut.request([String: [String]].self, from: EndpointMock()) { result in
                        switch result {
                        case.success:
                            fail("Unexpected result")
                        case .failure(let serviceError):
                            guard let error = serviceError as? APIError else {
                                fail("Unexpected result")
                                return
                            }
                            expect(error).to(equal(APIError.request))
                        }
                    }
                }
            }
        }
        
        func makeStub(with success: Bool = true) {
            stub(httpClientMock) { stub in
                when(stub.request(any(Endpoint.self), completion: anyClosure())).then { (_, completion) in
                    if success {
                        completion?(Result.success(Data("{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}".utf8)))
                        return
                    }
                    completion?(Result.failure(APIError.request))
                }
            }
        }
    }
}
