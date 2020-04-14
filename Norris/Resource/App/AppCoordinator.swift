//
//  AppCoordinator.swift
//  Norris
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var window: UIWindow?
    var navigationController: UINavigationController
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        
        let presenter = FactsPresenter()
        let controller = FactsViewController(presenter: presenter)
        presenter.viewController = controller
        navigationController.pushViewController(controller, animated: true)
    }
    
}
