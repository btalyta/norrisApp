//
//  TagViewTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Norris

class TagViewTests: QuickSpec {
    override func spec() {
        var sut: TagView!
        
        beforeEach {
            sut = TagView(frame: CGRect(x: 0, y: 0, width: 120, height: 35))
        }
        
        describe("#show") {
            it("has valid snapshot") {
                sut.show(title: "UNCATEGORIZED")
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
