//
//  HttpClientTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import OHHTTPStubs

@testable import Norris

class HttpClientTests: QuickSpec {
    override func spec() {
        var sut: HttpClient!
        var endpointMock: Endpoint!
        
        beforeEach {
            sut = HttpClient()
            endpointMock = EndpointMock()
        }
        
        afterEach {
            HTTPStubs.removeAllStubs()
        }
        
        describe("#request") {
            context("when the request is successful") {
                it("retuns Data in completion") {
                    stubRequest()
                    sut.request(endpointMock) { result in
                        switch result {
                        case .success(let data):
                            expect(data).to(equal(Data()))
                        case .failure:
                            fail("Unexpected result")
                        }
                    }
                }
            }
            
            context("when the request fails") {
                it("retuns Error in completion") {
                    stubRequest(with: false)
                    sut.request(endpointMock) { result in
                        switch result {
                        case .success:
                            fail("Unexpected result")
                        case .failure(let serviceError):
                            guard let error = serviceError as? APIError else {
                                fail("Unexpected result")
                                return
                            }
                            expect(error).to(equal(APIError.unauthorized))
                        }
                    }
                }
            }
        }
        
        func stubRequest(with success: Bool = true) {
            stub(condition: isHost("testClient")) { _ in
                if success {
                    return HTTPStubsResponse(data: Data() ,
                                             statusCode: 200,
                                             headers: ["Content-Type": "application/json"])
                }
                
                return HTTPStubsResponse(data: Data(),
                                         statusCode: 401,
                                         headers: nil)
            }
        }
        
    }
}

class EndpointMock: Endpoint {
    var url: String {
        return "https://testClient"
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: [String: String] = ["Content-Type": "application/json"]
}
