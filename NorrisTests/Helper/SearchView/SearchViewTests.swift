//
//  SearchViewTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import Norris

class SearchViewTest: QuickSpec {
    override func spec() {
        var sut: SearchView!
        
        beforeEach {
            sut = SearchView(frame: CGRect(x: 0, y: 0,
                                           width: 375, height: 330))
        }
        
        describe("show") {
            it("has valid snapshot") {
                let suggestions = SuggestionsModelFactory().build()
                sut.show(viewModel: [SearchViewModel(title: "Categories", suggestions: suggestions.categories),
                                     SearchViewModel(title: "History", suggestions: suggestions.history)])
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
