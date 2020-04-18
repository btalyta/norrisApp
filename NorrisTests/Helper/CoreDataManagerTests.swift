//
//  ManagedContextTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble
import CoreData

@testable import Norris

class CoreDataManagerTests: QuickSpec {
    override func spec() {
        var sut: CoreDataManager!
        var contextManagerMock: ManagedContextMock!
        
        beforeEach {
            contextManagerMock = ManagedContextMock()
            sut = CoreDataManager(contextManager: contextManagerMock)
        }
        
        describe("updateFacts") {
            context("when tag is nil") {
                it("calls contextManager delete and saveData with correct fetchRequest") {
                    let expectedFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fact")
                    expectedFetchRequest.predicate = NSPredicate(format: "category == %@ && tag == %@",
                                                                 [NorrisStrings.uncategorized, ""])
                    sut.updateFacts(models: [FactModel(url: "", value: "", categories: nil)],
                                    tag: nil)
                    expect(contextManagerMock.fetchRequest).to(equal(expectedFetchRequest))
                    expect(contextManagerMock.saveWasCallled).to(beTrue())
                    expect(contextManagerMock.deleteWasCalled).to(beTrue())
                }
            }
            context("when tag isn't nil") {
                it("calls contextManager delete and saveData with correct fetchRequest") {
                    let expectedFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fact")
                    expectedFetchRequest.predicate = NSPredicate(format: "tag == %@ ", "animal")
                    sut.updateFacts(models: [FactModel(url: "", value: "", categories: nil)],
                                    tag: "animal")
                    expect(contextManagerMock.fetchRequest).to(equal(expectedFetchRequest))
                    expect(contextManagerMock.saveWasCallled).to(beTrue())
                    expect(contextManagerMock.deleteWasCalled).to(beTrue())
                }
            }
        }
        
        describe("fetchFacts(with text:)") {
            it("calls contextManager fetch with correct fetchRequest") {
                let expectedFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fact")
                expectedFetchRequest.predicate = NSPredicate(format: "tag == %@ ", "text")
                _ = sut.fetchFacts(with: "text")
                expect(contextManagerMock.fetchRequest).to(equal(expectedFetchRequest))
                expect(contextManagerMock.fetchWasCalled).to(beTrue())
            }
        }
        
        describe("fetchCategory") {
            it("calls contextManager fetch with correct fetchRequest") {
                let expectedFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fact")
                expectedFetchRequest.predicate = NSPredicate(format: "category == %@ ", "text")
                _ = sut.fetchCategory(with: "text")
                expect(contextManagerMock.fetchRequest).to(equal(expectedFetchRequest))
                expect(contextManagerMock.fetchWasCalled).to(beTrue())
            }
        }
        
        describe("fetchFacts(with total:)") {
            it("calls contextManager fetch with correct fetchRequest") {
                let expectedFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fact")
                _ = sut.fetchFacts(with: 10)
                expect(contextManagerMock.fetchRequest).to(equal(expectedFetchRequest))
                expect(contextManagerMock.fetchWasCalled).to(beTrue())
            }
        }
    }
}

class ManagedContextMock: ManagedContextProtocol {
    var fetchWasCalled = false
    var deleteWasCalled = false
    var saveWasCallled = false
    var fetchRequest: NSFetchRequest<NSManagedObject>?
    
    func fetch(with fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject] {
        self.fetchRequest = fetchRequest
        fetchWasCalled = true
        return []
    }
    
    func delete(with fetchRequest: NSFetchRequest<NSManagedObject>) {
        self.fetchRequest = fetchRequest
        deleteWasCalled = true
    }
    
    func saveData(models: [FactModel], tag: String, entityName: String) {
        saveWasCallled = true
    }
}
