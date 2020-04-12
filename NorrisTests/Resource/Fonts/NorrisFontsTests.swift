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
    }
}
