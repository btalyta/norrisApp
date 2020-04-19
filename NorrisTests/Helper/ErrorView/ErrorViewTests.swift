//
//  ErrorViewTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 19/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Norris

class ErrorViewTests: QuickSpec {
    override func spec() {
        var sut: ErrorView!
        
        beforeEach {
            sut = ErrorView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
        }
        
        describe("#show") {
            it("has valid snapshot") {
                sut.show(error: "Could not connect to the server.\nTry again")
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
