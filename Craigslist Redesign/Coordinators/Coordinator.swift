//
//  Coordinator.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }

    func start()
}

extension Coordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
