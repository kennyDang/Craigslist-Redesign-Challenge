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

    init(window: UIWindow, rootViewController: UIViewController) {
        self.window = window
        self.rootViewController = rootViewController

        navigationViewController = UINavigationController(rootViewController: self.rootViewController)
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
