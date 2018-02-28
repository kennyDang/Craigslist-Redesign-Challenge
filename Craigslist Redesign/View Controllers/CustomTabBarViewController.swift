//
//  CustomTabBarViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class CustomTabBarViewController: BaseViewController {

    // MARK: - Instance properties

    fileprivate var mainView: CustomTabBarView {
        return self.view as! CustomTabBarView
    }

    let profileViewController = ProfileViewController()

    let homeListCoordinator = HomeListCoordinator()
    let messageListCoordinator = MessageListCoordinator()

    // MARK: - Initialization

    override func loadView() {
        let customTabBarView = CustomTabBarView()
        customTabBarView.delegate = self

        view = customTabBarView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        startCoordinators()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setup(viewController: homeListCoordinator.rootViewController)
    }

    // MARK: - Setup

    private func setup(viewController: UIViewController) {
        addChildViewController(viewController)
        mainView.contentView.addSubview(viewController.view)
        viewController.view.frame = mainView.contentView.frame
        viewController.didMove(toParentViewController: self)
    }

    private func removeChildViewControllers() {
        profileViewController.remove()
        homeListCoordinator.rootViewController.remove()
        messageListCoordinator.rootViewController.remove()
    }

    private func startCoordinators() {
        homeListCoordinator.start()
        messageListCoordinator.start()
    }

}

extension CustomTabBarViewController: CustomTabBarDelegate {
    func customTabBarDidSelect(button: UIButton) {
        removeChildViewControllers()

        switch button.tag {
        case 0:
            setup(viewController: homeListCoordinator.rootViewController)
        case 1:
            setup(viewController: messageListCoordinator.rootViewController)
        case 2:
            setup(viewController: profileViewController)
        default:
            print("Unexpected button pressed")
        }
    }
}
