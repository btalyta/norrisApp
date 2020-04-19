//
//  SearchCellTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import Norris

class SearchCellTests: QuickSpec {
    override func spec() {
        var sut: SearchCell!
        
        describe("show") {
            it("has valid snapshot") {
                sut = SearchCell()
                sut.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
                sut.show(suggestion: "uncategorized")
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
