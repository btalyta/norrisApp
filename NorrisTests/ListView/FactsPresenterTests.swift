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
            }
        }
        
        describe("didSelectCard") {
            it("calls presenter wantsToShare") {
                stubSearchCategory()
                sut.wantsToSearch(category: "")
                
                let captor = ArgumentCaptor<String>()
                sut.didSelectCard(with: IndexPath(row: 0, section: 0))
                
                verify(controllerMock).wantsToShare(url: captor.capture())
                expect(captor.value).to(equal(model.url))
            }
        }
        
        describe("wantsToSearch(category:)") {
            context("when search returns success") {
                it("calls viewController show") {
                    stubSearchCategory()
                    let captor = ArgumentCaptor<FactsViewModel>()
                    let expectedModel = makeViewModel(with: [model])
                    sut.wantsToSearch(category: "")
                    
                    verify(controllerMock).showFacts(viewModel: captor.capture())
                    expect(captor.value).to(equal(expectedModel))
                }
            }
            context("when search returns error") {
                it("calls viewController show error") {
                    stubSearchCategory(with: false)
                    sut.wantsToSearch(category: "")
                    
                    verify(controllerMock).showError()
                }
            }
        }
        
        describe("wantsToSearch(text:)") {
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
