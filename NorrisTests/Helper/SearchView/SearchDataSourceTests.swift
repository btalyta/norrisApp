//
//  SearchDataSource.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class SearchDataSourceTests: QuickSpec {
    override func spec() {
        var sut: SearchDataSource!
        var items: [SearchViewModel]!
        var collection: UICollectionView!
        let index = IndexPath(row: 0, section: 0)
        
        beforeEach {
            let suggestions = SuggestionsModelFactory().build()
            items = [SearchViewModel(title: "Categories", suggestions: suggestions.categories),
                     SearchViewModel(title: "History", suggestions: suggestions.history)]
            sut = SearchDataSource(items: items)
            let layout = UICollectionViewFlowLayout()
            layout.headerReferenceSize = CGSize(width: 320, height: 100)
            collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(SearchHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SearchHeaderView.identifier)
            collection.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
            collection.dataSource = sut
        }
        
        describe("numberOfSections") {
            it("returns correct value") {
                let result = sut.numberOfSections(in: collection)
                expect(result).to(equal(2))
            }
        }
        
        describe("collectionView(numberOfItemsInSection)") {
            it("returns correct value") {
                var result = sut.collectionView(collection, numberOfItemsInSection: 0)
                expect(result).to(equal(8))
                result = sut.collectionView(collection, numberOfItemsInSection: 1)
                expect(result).to(equal(3))
            }
        }
        
        describe("collectionView(cellForItemAt)") {
            it("returns cell of type SearchCell") {
                let result = sut.collectionView(collection, cellForItemAt: index)
                expect(result).to(beAKindOf(SearchCell.self))
            }
        }
        
        describe("collectionView(didSelectItemAt)") {
            it("calls didTapSuggestions") {
                var resultIndex: IndexPath?
                var didTapSuggestionsWasCalled = false
                
                sut.didTapSuggestions = { index in
                    resultIndex = index
                    didTapSuggestionsWasCalled = true
                }
                
                sut.collectionView(collection, didSelectItemAt: index)
                
                expect(resultIndex).to(equal(index))
                expect(didTapSuggestionsWasCalled).to(beTrue())
            }
        }
    }
}
