//
//  NorrisColorsTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class NorrisColorsTests: QuickSpec {
    override func spec() {
        describe("tagColor") {
            it("returns correct color") {
                let expectedColor = UIColor(displayP3Red: 63/255, green: 167/255, blue: 214/255, alpha: 1.0)
                expect(NorrisColors.tagColor).to(equal(expectedColor))
            }
        }
        
        describe("errorColor") {
            it("returns correct color") {
                let expectedColor = UIColor(displayP3Red: 240/255, green: 113/255, blue: 97/255, alpha: 1.0)
                expect(NorrisColors.errorColor).to(equal(expectedColor))
            }
        }
        
        describe("tagTextColor") {
            it("returns correct color") {
                let expectedColor = UIColor.white
                expect(NorrisColors.tagTextColor).to(equal(expectedColor))
            }
        }
        
        describe("factTextColor") {
            it("returns correct color") {
                let expectedColor = UIColor.black
                expect(NorrisColors.factTextColor).to(equal(expectedColor))
            }
        }
        
        describe("baseColor") {
            it("returns correct color") {
                let expectedColor = UIColor(displayP3Red: 69/255, green: 205/255, blue: 144/255, alpha: 1.0)
                expect(NorrisColors.baseColor).to(equal(expectedColor))
            }
        }
    }
}
