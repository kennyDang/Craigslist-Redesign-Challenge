//
//  MessageListCoordinator.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/27/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class MessageListCoordinator: Coordinator {

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
        let messageListViewController = MessageListViewController()

        navigationController.pushViewController(messageListViewController, animated: true)
    }
}
