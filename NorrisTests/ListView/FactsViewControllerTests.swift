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
        var presenterMock: MockFactsPresenterProtocol!
        
        beforeEach {
            view = FactsView()
            presenterMock = MockFactsPresenterProtocol()
            sut = FactsViewController(presenter: presenterMock, contentView: view)
            
            stub(presenterMock) { stub in
                when(stub.viewDidLoad()).thenDoNothing()
                when(stub.didSelectCard(with: any(IndexPath.self))).thenDoNothing()
                when(stub.wantsToSearch(category: anyString())).thenDoNothing()
                when(stub.wantsToSearch(text: anyString())).thenDoNothing()
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
        }
    }
}
