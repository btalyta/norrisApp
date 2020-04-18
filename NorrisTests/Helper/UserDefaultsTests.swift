//
//  UserDefaultsTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class UserDefaultsTests: QuickSpec {
    override func spec() {
        beforeEach {
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: UserDefaultsKeys.categories.rawValue)
            defaults.removeObject(forKey: UserDefaultsKeys.suggestions.rawValue)
        }
        
        describe("init") {
            context("when there is no data storange") {
                it("returns corect values") {
                    expect(UserDefaults.getValue(key: .categories)).to(beNil())
                    expect(UserDefaults.getValue(key: .suggestions)).to(beNil())
                }
            }
            context("when there is data storange") {
                it("returns corect values") {
                    UserDefaults.setValue(key: .categories, value: ["show", "animal"])
                    UserDefaults.setValue(key: .suggestions, value: ["show", "animal"])
                    
                    expect(UserDefaults.getValue(key: .categories)).to(equal(["show", "animal"]))
                    expect(UserDefaults.getValue(key: .suggestions)).to(equal(["show", "animal"]))
                }
            }
        }
    }
}
