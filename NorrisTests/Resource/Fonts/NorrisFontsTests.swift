//
//  NorrisFontsTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class NorrisFontsTests: QuickSpec {
    override func spec() {
        describe("tagFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "Chinacat", size: 12)
                expect(NorrisFonts.tagFont).to(equal(expectedFont))
            }
        }
        
        describe("factFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "ChinacatThin", size: 18)
                expect(NorrisFonts.factFont).to(equal(expectedFont))
            }
        }
        
        describe("factSmallFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "ChinacatThin", size: 14)
                expect(NorrisFonts.factSmallFont).to(equal(expectedFont))
            }
        }
        
        describe("suggestionHeaderFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "Chinacat", size: 18)
                expect(NorrisFonts.suggestionHeaderFont).to(equal(expectedFont))
            }
        }
        
        describe("headerFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "Chinacat", size: 32)
                expect(NorrisFonts.headerFont).to(equal(expectedFont))
            }
        }
        
        describe("titleFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "Chinacat", size: 24)
                expect(NorrisFonts.titleFont).to(equal(expectedFont))
            }
        }
        
        describe("suggestionFont") {
            it("returns correct font") {
                let expectedFont = UIFont(name: "Chinacat", size: 14)
                expect(NorrisFonts.suggestionFont).to(equal(expectedFont))
            }
        }
    }
}
