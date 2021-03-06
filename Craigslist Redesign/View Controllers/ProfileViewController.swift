//
//  ProfileViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    // MARK: - Instance properties

    let profileView = ProfileView()

    // MARK: - Initialization

    override func loadView() {
        view = profileView
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
