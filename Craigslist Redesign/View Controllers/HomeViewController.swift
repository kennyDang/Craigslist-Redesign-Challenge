//
//  HomeViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Instance properties

    let homeView = HomeView()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Los Angeles, CA"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = homeView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        let rightButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(didTapFilter))

        navigationItem.rightBarButtonItem = rightButtonItem
    }

    @objc private func didTapFilter() {
        print("Filter")
    }

}
