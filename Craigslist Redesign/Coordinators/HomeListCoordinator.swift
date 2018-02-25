//
//  HomeListCoordinator.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class HomeListCoordinator: Coordinator {

    // MARK: - Instance properties

    var childCoordinators: [Coordinator]

    public var rootViewController: UIViewController {
        return self.navigationController
    }

    private let navigationController: UINavigationController

    public init() {
        childCoordinators = []
        navigationController = UINavigationController()
    }

    func start() {
        showHomeListViewController()
    }

    private func showHomeListViewController() {
        let homeViewController = HomeViewController()
        homeViewController.homeView.delegate = self
        navigationController.pushViewController(homeViewController, animated: true)
    }

}

extension HomeListCoordinator: CategoryDelegate {
    func didSelectCategory(category: Category) {
        print("Coordinator got category: \(category)")
    }
}
