//
//  CategoryDetailListViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/24/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class CategoryDetailListViewController: UIViewController {

    var category: Category

    init(category: Category) {
        self.category = category

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

}
