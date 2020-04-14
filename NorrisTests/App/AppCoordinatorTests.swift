//
//  AppCoordinatorTests.swift
//  NorrisTests
//
//  Created by Bárbara Souza on 14/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import Quick
import Nimble

@testable import Norris

class AppCoordinatorTests: QuickSpec {
    override func spec() {
        var sut: AppCoordinator!
        var window: UIWindow!
        
        beforeEach {
            window = UIWindow()
            sut = AppCoordinator(window: window, navigationController: UINavigationController())
        }
        
        describe("#start") {
            it("shows FactsViewController") {
                sut.start()
                let controller = sut.navigationController.viewControllers.first
                
                expect(controller).to(beAKindOf(FactsViewController.self))
            }
        }
    }
}
