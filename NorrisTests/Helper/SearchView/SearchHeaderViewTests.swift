//
//  SearchHeaderViewTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Norris

class SearchHeaderViewTests: QuickSpec {
    override func spec() {
        var sut: SearchHeaderView!
        
        describe("show") {
            it("has valid snapshot") {
                sut = SearchHeaderView(frame: CGRect(x: 0, y: 0,
                                                     width: 320, height: 50))
                sut.show(title: "Categories")
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
