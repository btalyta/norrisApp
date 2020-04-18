//
//  FactsViewControllerTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Cuckoo

@testable import Norris

class FactsViewControllerTests: QuickSpec {
    override func spec() {
        var sut: FactsViewController!
        var view: FactsView!
        var searchView: SearchView!
        var presenterMock: MockFactsPresenterProtocol!
        
        beforeEach {
            view = FactsView()
            searchView = SearchView()
            presenterMock = MockFactsPresenterProtocol()
            sut = FactsViewController(presenter: presenterMock, contentView: view,
                                      suggestionsView: searchView)
            
            stub(presenterMock) { stub in
                when(stub.viewDidLoad()).thenDoNothing()
                when(stub.didSelectCard(with: any(IndexPath.self))).thenDoNothing()
                when(stub.wantsToSearch(with: any(IndexPath.self))).thenDoNothing()
                when(stub.wantsToSearch(text: anyString())).thenDoNothing()
                when(stub.wantsToShowSuggestions()).thenDoNothing()
            }
            
            _ = sut.view
        }
        
        describe("viewDidLoad") {
            it("calls presenter viewDidLoad") {
                verify(presenterMock).viewDidLoad()
            }
        }
        
        describe("bidLayoutEvents") {
            context("#didTapShareButton") {
                it("calls presenter didSelectCard") {
                    let captor = ArgumentCaptor<IndexPath>()
                    
                    view.didTapShareButton?(IndexPath(row: 0, section: 0))
                    verify(presenterMock).didSelectCard(with: captor.capture())
                    expect(captor.value).to(equal(IndexPath(row: 0, section: 0)))
                }
            }
            
            context("didTapSuggestion") {
                it("calls presenter wantsToSearch") {
                    let captor = ArgumentCaptor<IndexPath>()
                    let index = IndexPath(row: 0, section: 0)
                    
                    searchView.didTapSuggestion?(index)
                    verify(presenterMock).wantsToSearch(with: captor.capture())
                    expect(captor.value).to(equal(IndexPath(row: 0, section: 0)))
                }
            }
        }
        
        describe("searchBarTextDidBeginEditing") {
            it("calls presenter wantsToShowSuggestions") {
                sut.searchBarTextDidBeginEditing(UISearchBar())
                verify(presenterMock).wantsToShowSuggestions()
            }
        }
        
        describe("searchBarSearchButtonClicked") {
            it("calls presenter") {
                let searchBar = UISearchBar()
                searchBar.text = "Text"
                let captor = ArgumentCaptor<String>()
                
                sut.searchBarSearchButtonClicked(searchBar)
                verify(presenterMock).wantsToSearch(text: captor.capture())
                expect(captor.value).to(equal("Text"))
            }
        }
    }
}
