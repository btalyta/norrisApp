//
//  FactsViewControllerTests.swift
//  NorrisUITests
//
//  Created by Bárbara Souza on 19/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import Cuckoo
import KIF_Quick

@testable import Norris

class FactsViewControllerUITests: KIFSpec {
    override func spec() {
        var sut: FactsViewController!
        var factView: FactsView!
        var searchView: SearchView!
        var presenterMock: MockFactsPresenterProtocol!
        var searchController: UISearchController!
        var window: UIWindow!

        beforeEach {
            factView = FactsView()
            searchView = SearchView()
            searchController = UISearchController(searchResultsController: nil)
            presenterMock = MockFactsPresenterProtocol()
            sut = FactsViewController(presenter: presenterMock,
                                      contentView: factView,
                                      suggestionsView: searchView,
                                      searchController: searchController)
            window = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
            window.makeKeyAndVisible()
            stubPresenter()
            window.rootViewController = sut
        }

        afterEach {
            UIView.setAnimationsEnabled(false)
            window.isHidden = true
            window = nil
        }

        describe("search") {
            context("when there is text in seachBar") {
                it("calls presenter wantsToSearch and show result") {
                    sut.searchBarTextDidBeginEditing(searchController.searchBar)
                    verify(presenterMock).wantsToShowSuggestions()
                    
                    sut.showSuggestions(viewModel: [SearchViewModel(title: NorrisStrings.categories,
                                                                    suggestions: ["travel", "sport", "show"]),
                                                    SearchViewModel(title: NorrisStrings.history,
                                                                    suggestions: ["travel", "sport", "show"])])
                    
                    expect(window).toEventually(haveValidSnapshot(named: "show search view"))
                    
                    searchController.searchBar.text = "sport"
                    sut.searchBarSearchButtonClicked(searchController.searchBar)
                    
                    verify(presenterMock).wantsToSearch(text: anyString())
                    
                    sut.showFacts(viewModel: FactsViewModel(cells: FactCellViewModelFactory.build(), isLoading: false))
                    expect(window).toEventually(haveValidSnapshot(named: "show result"))
                }
            }
            
            context("when tap in suggestions") {
                it("calls presenter wantsToSearch and show result") {
                    sut.searchBarTextDidBeginEditing(searchController.searchBar)
                    verify(presenterMock).wantsToShowSuggestions()
                    
                    sut.showSuggestions(viewModel: [SearchViewModel(title: NorrisStrings.categories,
                                                                    suggestions: ["travel", "sport", "show"]),
                                                    SearchViewModel(title: NorrisStrings.history,
                                                                    suggestions: ["travel", "sport", "show"])])
                    
                    expect(window).toEventually(haveValidSnapshot(named: "show search view"))
                    
                    tester().tapView(withAccessibilityLabel: "tag_view")
                    
                    verify(presenterMock).wantsToSearch(with: any())
                    
                    sut.showFacts(viewModel: FactsViewModel(cells: FactCellViewModelFactory.build(), isLoading: false))
                    expect(window).toEventually(haveValidSnapshot(named: "show result"))
                }
            }
        }
        
        describe("share") {
            it("calls presenter didSelectCard and show share controller") {
                sut.showFacts(viewModel: FactsViewModel(cells: FactCellViewModelFactory.build(), isLoading: false))
                expect(window).toEventually(haveValidSnapshot(named: "show result"))
                
                tester().tapView(withAccessibilityLabel: "share_button")
                verify(presenterMock).didSelectCard(with: any())
                
                sut.wantsToShare(url: "www.facts.com")
                expect(window).toEventually(haveValidSnapshot(named: "show share"))
            }
        }

        func stubPresenter() {
            stub(presenterMock) { stub in
                when(stub.viewDidLoad()).thenDoNothing()
                when(stub.didSelectCard(with: any(IndexPath.self))).thenDoNothing()
                when(stub.wantsToSearch(with: any(IndexPath.self))).thenDoNothing()
                when(stub.wantsToSearch(text: anyString())).thenDoNothing()
                when(stub.wantsToShowSuggestions()).thenDoNothing()
            }
        }
    }
}
