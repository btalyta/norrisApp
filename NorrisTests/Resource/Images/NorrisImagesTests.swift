//
//  NorrisImagesTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class NorrisImagesTests: QuickSpec {
    override func spec() {
        describe("#shareIcon") {
            it("return correct image") {
                let expectedImage = UIImage(named: "shareIcon")
                expect(NorrisImages.shareIcon).to(equal(expectedImage))
            }
        }
        
        describe("#errorIcon") {
            it("return correct image") {
                let expectedImage = UIImage(named: "errorIcon")
                expect(NorrisImages.errorIcon).to(equal(expectedImage))
            }
        }
    }
}
