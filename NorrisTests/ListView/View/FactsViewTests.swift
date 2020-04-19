//
//  FactViewTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Norris

class FactsViewTests: QuickSpec {
    override func spec() {
        var sut: FactsView!
        var items: [FactCellViewModel]!
        
        beforeEach {
            items = [
                FactCellViewModel(fact: "Chuck Norris believes that Shanimal rocks", tag: "UNCATEGORIZED"),
                FactCellViewModel(fact: "Chuck Norris was attacked by a vicious pit bull and it ended up with a trip to the hospital. The Vet.",
                                  tag: "Other"),
                FactCellViewModel(fact: "Some people can make animal shapes out of balloons. Chuck Norris can do the same with human organs.",
                                  tag: "UNCATEGORIZED"),
                FactCellViewModel(fact: "Darwins theory of evoloution ape animal caveman human Chuck Norris",
                                  tag: "Animal")
            ]
            sut = FactsView(frame: CGRect(x: 0, y: 0, width: 320, height: 580))
        }
        
        describe("show") {
            context("when view isn't loading") {
                it("has valid snapshot") {
                    sut.show(viewModel: FactsViewModel(cells: items, isLoading: false))
                    expect(sut).to(haveValidSnapshot())
                }
            }
            
            context("when view is loading") {
                it("has valid snapshot") {
                    sut.show(viewModel: FactsViewModel(cells: items, isLoading: true))
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
