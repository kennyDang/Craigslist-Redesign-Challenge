//
//  MessageListViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class MessageListViewController: BaseViewController {

    // MARK: - Instance properties

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)

        return tableView
    }()

    var data = [Message]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        setupTableView()
        fetchData()
        title = "Messages"
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

    private func setupLayout() {
        tableView.pin.all()
    }

    private func fetchData() {
        data = [Message(image: #imageLiteral(resourceName: "User2"), name: "Jane Doe", date: "3:24 pm", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
                Message(image: #imageLiteral(resourceName: "User4"), name: "Stevey Steve", date: "6:10 pm", description: "xcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit"),
                Message(image: #imageLiteral(resourceName: "User3"), name: "Anna Jonson", date: "4:30 pm", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")]
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MessageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier, for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }
        let item = data[indexPath.row]

        cell.userImageView.image = item.image
        cell.dateLabel.text = item.date
        cell.messageLabel.text = item.description
        cell.userNameLabel.text = item.name

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

