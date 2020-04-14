//
//  FactsDataSourceTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class FactsDataSourceTests: QuickSpec {
    override func spec() {
        var sut: FactsDataSource!
        var items: [FactCellViewModel]!
        var tableView: UITableView!
        let index = IndexPath(row: 0, section: 0)
        
        beforeEach {
            let model = FactCellViewModel(fact: "", tag: "")
            items = [model, model, model]
            sut = FactsDataSource(items: items)
            tableView = UITableView()
            tableView.register(FactCell.self, forCellReuseIdentifier: FactCell.identifier)
            tableView.dataSource = sut
        }
        
        describe("#numberOfRowsInSection") {
            it("returns correct number") {
                let result = sut.tableView(tableView, numberOfRowsInSection: 0)
                expect(result).to(equal(items.count))
            }
        }
        
        describe("#cellForRowAt") {
            var cell: UITableViewCell?
            beforeEach {
                cell = sut.tableView(tableView, cellForRowAt: index)
            }
            
            it("returns cell of type FactCell") {
                expect(cell).to(beAKindOf(FactCell.self))
            }
            
            it("calls completion") {
                var didTapCell = false
                var result: IndexPath?
                
                guard let factCell = cell as? FactCell else {
                    fail("Unexpected result")
                    return
                }
                
                sut.didTapShareButton = { index in
                    didTapCell = true
                    result = index
                }
                factCell.didTapShareButton?(index)
                
                expect(didTapCell).to(beTrue())
                expect(result).to(equal(index))
            }
        }
    }
}
