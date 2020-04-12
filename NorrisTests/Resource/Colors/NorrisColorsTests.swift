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
                let expectedColor = UIColor(displayP3Red: 240/255, green: 113/255, blue: 97/255, alpha: 1.0)
                expect(NorrisColors.tagColor).to(equal(expectedColor))
            }
        }
    }
}
