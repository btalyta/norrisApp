//
//  FactCellTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 12/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Norris

class FactCellTests: QuickSpec {
    override func spec() {
        var sut: FactCell!
        var index: IndexPath!
        
        beforeEach {
            sut = FactCell()
            index = IndexPath(row: 0, section: 0)
        }
        
        describe("#show") {
            context("when maxCharacters is default") {
                context("when there is a short fact") {
                    it("has valid snapshot") {
                        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 160)
                        sut.show(viewModel: FactCellViewModel(fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                              tag: "UNCATEGORIZED"),
                                 index: index)
                        expect(sut).to(haveValidSnapshot())
                    }
                }
                
                context("when there is a long fact") {
                    it("has valid snapshot") {
                        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 270)
                        sut.show(viewModel: FactCellViewModel(fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum ultricies sem, ac cursus neque lacinia sed. Integer vitae libero convallis erat porta sodales. Duis nec bibendum justo. Sed in lacus at dolor condimentum auctor. Nulla posuere nulla in blandit tincidunt.",
                                                              tag: "UNCATEGORIZED"),
                                 index: index)
                        expect(sut).to(haveValidSnapshot())
                    }
                }
            }
            
            context("when maxCharacters is custom") {
                context("when there is a short fact") {
                    it("has valid snapshot") {
                        sut.maxCharacters = 30
                        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 140)
                        sut.show(viewModel: FactCellViewModel(fact: "Lorem ipsum dolor sit amet",
                                                              tag: "UNCATEGORIZED"),
                                 index: index)
                        expect(sut).to(haveValidSnapshot())
                    }
                }
                
                context("when there is a long fact") {
                    it("has valid snapshot") {
                        sut.maxCharacters = 30
                        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 150)
                        sut.show(viewModel: FactCellViewModel(fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                              tag: "UNCATEGORIZED"),
                                 index: index)
                        expect(sut).to(haveValidSnapshot())
                    }
                }
            }
        }
        
        describe("#didTapButton") {
            it("calls didTapShareButton completion") {
                var didTapShare = false
                var expectedIndex: IndexPath?
                
                sut.didTapShareButton = { index in
                    didTapShare = true
                    expectedIndex = index
                }
                sut.show(viewModel: FactCellViewModel(fact: "", tag: ""), index: index)
                sut.didTapButton()
                expect(didTapShare).to(beTrue())
                expect(expectedIndex).to(equal(index))
            }
        }
    }
}
