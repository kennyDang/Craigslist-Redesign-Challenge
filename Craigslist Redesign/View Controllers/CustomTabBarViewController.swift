//
//  CustomTabBarViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class CustomTabBarViewController: BaseViewController {
    override func loadView() {
        view = CustomTabBarView()
    }
}
