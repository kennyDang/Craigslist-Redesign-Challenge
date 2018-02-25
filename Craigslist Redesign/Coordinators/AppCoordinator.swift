//
//  AppCoordinator.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Instance properties

    let window: UIWindow
    let rootViewController: UIViewController
    let navigationViewController: UINavigationController

    var childCoordinators: [Coordinator] = []

    // MARK: - Initialization

    init(window: UIWindow, rootViewController: BaseViewController) {
        self.window = window
        self.rootViewController = rootViewController

        navigationViewController = UINavigationController(rootViewController: self.rootViewController)
        navigationViewController.navigationBar.isHidden = true
    }

    func start() {
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
