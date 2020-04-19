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
        setupNavigationController()
    }
    
    func start() {
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        
        let presenter = FactsPresenter()
        let controller = FactsViewController(presenter: presenter)
        presenter.viewController = controller
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = NorrisColors.baseColor
        appearance.titleTextAttributes = [.foregroundColor: NorrisColors.tagTextColor,
                                          .font: NorrisFonts.titleFont ?? UIFont()]
        appearance.largeTitleTextAttributes = [.foregroundColor: NorrisColors.tagTextColor,
                                               .font: NorrisFonts.headerFont ?? UIFont()]
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
