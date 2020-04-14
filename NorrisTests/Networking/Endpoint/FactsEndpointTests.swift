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

class FactsEndpointTests: QuickSpec {
    override func spec() {
        var sut: FactsEndpoint!
        
        describe("#init") {
            context("when is categories") {
                beforeEach {
                    sut = FactsEndpoint.categories(category: "animal")
                }
                it("the url is https://api.chucknorris.io/jokes/random?category=animal") {
                    expect(sut.url).to(equal("https://api.chucknorris.io/jokes/random?category=animal"))
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
            context("when is categories") {
                beforeEach {
                    sut = FactsEndpoint.text(text: "animal")
                    
                }
                
                it("the url is https://api.chucknorris.io/jokes/search?query=animal") {
                    expect(sut.url).to(equal("https://api.chucknorris.io/jokes/search?query=animal"))
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
}
