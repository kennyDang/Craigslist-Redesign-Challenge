//
//  ProfileCoordinator.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/28/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {

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
        showMessageListController()
    }

    private func showMessageListController() {
        let profileViewController = ProfileViewController()
        profileViewController.profileView.viewPostingsDelegate = self
        profileViewController.profileView.viewSettingsDelegate = self

        navigationController.pushViewController(profileViewController, animated: true)
    }
}

extension ProfileCoordinator: ViewSettingsDelegate {
    func presentSettingsViewController() {
        navigationController.pushViewController(SettingsViewController(), animated: true)
    }
}

extension ProfileCoordinator: ViewPostingsDelegate {
    func presentPostingsViewController() {
        navigationController.pushViewController(PostListViewController(), animated: true)
    }
}
