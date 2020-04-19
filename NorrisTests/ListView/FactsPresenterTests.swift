//
//  FactsPresenterTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import Cuckoo

@testable import Norris

class FactsPresenterTests: QuickSpec {
    override func spec() {
        var sut: FactsPresenter!
        var controllerMock: MockFactsViewControllerProtocol!
        var repositoryMock: MockFactsRepositoryProtocols!
        let model = FactModel(url: "https//norris-fact",
                              value: "Chuck Norris believes that Shanimal rocks.",
                              categories: nil)
        
        beforeEach {
            repositoryMock = MockFactsRepositoryProtocols()
            controllerMock = MockFactsViewControllerProtocol()
            sut = FactsPresenter(repository: repositoryMock)
            sut.viewController = controllerMock
            
            stub(controllerMock) { stub in
                when(stub.showError()).thenDoNothing()
                when(stub.showFacts(viewModel: any(FactsViewModel.self))).thenDoNothing()
                when(stub.wantsToShare(url: anyString())).thenDoNothing()
                when(stub.showSuggestions(viewModel: any([SearchViewModel].self))).thenDoNothing()
            }
            
            stub(repositoryMock) { stub in
                when(stub.requestLocalFacts(with: any(), completion: anyClosure())).thenDoNothing()
            }
        }
        
        describe("viewDidLoad") {
            context("when returns more than 8 categories") {
                beforeEach {
                    stubSuggestions(with: SuggestionsModelFactory().build(categories: 16))
                    sut.viewDidLoad()
                }
                
                it("calls repository requestSuggestions") {
                    verify(repositoryMock).requestSuggestions(completion: anyClosure())
                }
                it("saves only 8 categories and returns correct properties") {
                    expect(sut.suggestions[0].suggestions.count).to(equal(8))
                    expect(sut.suggestions[0].title).to(equal("Categories"))
                    expect(sut.suggestions[1].suggestions.count).to(equal(3))
                    expect(sut.suggestions[1].title).to(equal("History"))
                }
                it("calls repository requestLocalFacts") {
                    verify(repositoryMock).requestLocalFacts(with: any(), completion: anyClosure())
                }
            }
            
            context("when returns 8 categories") {
                beforeEach {
                    stubSuggestions(with: SuggestionsModelFactory().build(categories: 8))
                    sut.viewDidLoad()
                }
                
                it("calls repository requestSuggestions") {
                    verify(repositoryMock).requestSuggestions(completion: anyClosure())
                }
                it("returns correct properties") {
                    expect(sut.suggestions[0].suggestions.count).to(equal(8))
                    expect(sut.suggestions[0].title).to(equal("Categories"))
                    expect(sut.suggestions[1].suggestions.count).to(equal(3))
                    expect(sut.suggestions[1].title).to(equal("History"))
                }
            }
        }
        
        describe("didSelectCard") {
            it("calls presenter wantsToShare") {
                stubSearchText()
                sut.wantsToSearch(text: "")
                
                let captor = ArgumentCaptor<String>()
                sut.didSelectCard(with: IndexPath(row: 0, section: 0))
                
                verify(controllerMock).wantsToShare(url: captor.capture())
                expect(captor.value).to(equal(model.url))
            }
        }
        
        describe("wantsToSearch(with index:)") {
            beforeEach {
                stubSuggestions(with: SuggestionsModelFactory().build())
                sut.viewDidLoad()
            }
            
            context("when a category is selected") {
                context("when search returns success") {
                    it("calls viewController show") {
                        stubSearchCategory()
                        let index = IndexPath(row: 0, section: 0)
                        let captor = ArgumentCaptor<FactsViewModel>()
                        let expectedModel = makeViewModel(with: [model])
                        sut.wantsToSearch(with: index)
                        
                        verify(controllerMock).showFacts(viewModel: captor.capture())
                        expect(captor.value).to(equal(expectedModel))
                    }
                }
                context("when search returns error") {
                    it("calls viewController show error") {
                        stubSearchCategory(with: false)
                        let index = IndexPath(row: 0, section: 0)
                        sut.wantsToSearch(with: index)
                        
                        verify(controllerMock).showError()
                    }
                }
            }
            
            context("when history is selected") {
                context("when search returns success") {
                    it("calls viewController show") {
                        stubSearchText()
                        let index = IndexPath(row: 0, section: 1)
                        let captor = ArgumentCaptor<FactsViewModel>()
                        let expectedModel = makeViewModel(with: [model, model, model])
                        sut.wantsToSearch(with: index)
                        
                        verify(controllerMock).showFacts(viewModel: captor.capture())
                        expect(captor.value).to(equal(expectedModel))
                    }
                }
                context("when search returns error") {
                    it("calls viewController show error") {
                        stubSearchText(with: false)
                        let index = IndexPath(row: 0, section: 1)
                        sut.wantsToSearch(with: index)
                        
                        verify(controllerMock).showError()
                    }
                }
            }
        }
        
        describe("wantsToSearch(text:)") {
            beforeEach {
                stubSuggestions(with: SuggestionsModelFactory().build())
                sut.viewDidLoad()
            }
            
            context("when search returns success") {
                it("calls viewController show") {
                    stubSearchText()
                    let captor = ArgumentCaptor<FactsViewModel>()
                    let expectedModel = makeViewModel(with: [model, model, model])
                    sut.wantsToSearch(text: "")
                    
                    verify(controllerMock).showFacts(viewModel: captor.capture())
                    expect(captor.value).to(equal(expectedModel))
                }
            }
            context("when search returns error") {
                it("calls viewController show error") {
                    stubSearchText(with: false)
                    sut.wantsToSearch(text: "")
                    
                    verify(controllerMock).showError()
                }
            }
            context("when there is new text") {
                it("saves the text in first position") {
                    stubSearchText(with: false)
                    sut.wantsToSearch(text: "Goal")
                    var expectResult = ["goal"]
                    expectResult.append(contentsOf: SuggestionsModelFactory().build().history)
                    expect(sut.suggestions[1].suggestions).to(equal(expectResult))
                }
            }
            context("when there isn't new text") {
                it("doesn't save the text") {
                    stubSearchText(with: false)
                    sut.wantsToSearch(text: "SHOW")
                    var expectResult = SuggestionsModelFactory().build().history
                    expect(sut.suggestions[1].suggestions).to(equal(expectResult))
                }
            }
        }
        
        describe("wantsToShowSuggestions") {
            it("calls presenter showSuggestions") {
                sut.wantsToShowSuggestions()
                let captor = ArgumentCaptor<[SearchViewModel]>()
                verify(controllerMock).showSuggestions(viewModel: captor.capture())
                expect(captor.value).to(equal([SearchViewModel]()))
            }
        }
        
        func stubSuggestions(with suggestions: SuggestionsModel? = nil) {
            stub(repositoryMock) { stub in
                when(stub).requestSuggestions(completion: anyClosure()).then { completion in
                    if let suggestions = suggestions {
                        completion(.success(suggestions))
                    } else {
                        completion(.failure(APIError.jsonConversionFailure))
                    }
                }
            }
        }
        
        func stubSearchCategory(with success: Bool = true) {
            stub(repositoryMock) { stub in
                when(stub).requestFact(with: anyString(), completion: anyClosure()).then { _, completion in
                    if success {
                        completion(.success(model))
                    } else {
                        completion(.failure(APIError.jsonConversionFailure))
                    }
                }
            }
        }
        
        func stubSearchText(with success: Bool = true) {
            stub(repositoryMock) { stub in
                when(stub.requestCollection(with: anyString(), completion: anyClosure())).then { _, completion in
                if success {
                    completion(.success(FactsCollectionModel(result: [model, model, model])))
                } else {
                    completion(.failure(APIError.jsonConversionFailure))
                }
                    
                }
            }
        }
        
        func makeViewModel(with model: [FactModel]) -> FactsViewModel {
            let viewModel =  model.map {
                return FactCellViewModel(fact: $0.value,
                                         tag: $0.categories?.first ?? NorrisStrings.uncategorized)
            }
            return FactsViewModel(cells: viewModel)
        }
    }
}
