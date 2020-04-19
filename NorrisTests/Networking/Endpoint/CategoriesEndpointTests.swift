//
//  CategoriesEndpointTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class CategoriesEndpointTests: QuickSpec {
    override func spec() {
        var sut: CategoriesEndpoint!
        
        beforeEach {
            sut = CategoriesEndpoint()
        }
        
        describe("#init") {
            it("the url is https://api.chucknorris.io/jokes/categories") {
                expect(sut.url).to(equal("https://api.chucknorris.io/jokes/categories"))
            }
            
            it("the method is GET") {
                expect(sut.method).to(equal(.get))
            }
            
            it("the body is nil") {
                expect(sut.body).to(beNil())
            }
            
            it("the headers are [:]") {
                expect(sut.headers).to(equal([:]))
            }
        }
    }
}
