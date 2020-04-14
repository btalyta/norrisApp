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
    }
}
