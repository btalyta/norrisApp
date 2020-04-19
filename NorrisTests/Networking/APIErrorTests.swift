//
//  APIErrorTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 19/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class APIErrorTests: QuickSpec {
    override func spec() {
        var sut: APIError!
        
        describe("init") {
            context("when is jsonConversionFailure") {
                it("returns correct localizedDescription") {
                    sut = .jsonConversionFailure
                    expect(sut.localizedDescription).to(equal("Could not display results."))
                }
            }
            context("when is decode") {
                it("returns correct localizedDescription") {
                    sut = .decode
                    expect(sut.localizedDescription).to(equal("Could not display results."))
                }
            }
            context("when is invalidData") {
                it("returns correct localizedDescription") {
                    sut = .invalidData
                    expect(sut.localizedDescription).to(equal("Could not display results."))
                }
            }
            context("when is timeout") {
                it("returns correct localizedDescription") {
                    sut = .timeout
                    expect(sut.localizedDescription).to(equal("Connection error."))
                }
            }
            context("when is unauthorized") {
                it("returns correct localizedDescription") {
                    sut = .unauthorized
                    expect(sut.localizedDescription).to(equal("Unauthorized."))
                }
            }
            context("when is service") {
                it("returns correct localizedDescription") {
                    sut = .service
                    expect(sut.localizedDescription).to(equal("Could not connect to the server."))
                }
            }
            context("when is request") {
                it("returns correct localizedDescription") {
                    sut = .request
                    expect(sut.localizedDescription).to(equal("Could not connect to the server."))
                }
            }
        }
    }
}
