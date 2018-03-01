//
//  SettingsViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/28/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Instance properties

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none

        return tableView
    }()

    var data = [Setting]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        fetchData()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func fetchData() {
        data = [Setting(name: "Notifications"),
                Setting(name: "Postings"),
                Setting(name: "Night Mode"),
                Setting(name: "Privacy")]
    }

    private func setupLayout() {
        tableView.pin.all()
    }

}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.reuseIdentifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        cell.settingsLabel.text = data[indexPath.row].name

        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
