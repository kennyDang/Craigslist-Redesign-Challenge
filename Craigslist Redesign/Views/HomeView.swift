//
//  HomeView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class HomeView: BaseView {

    // MARK: - Instance properties

    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

        return tableView
    }()

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()

        return searchBar
    }()

    var data = [CategoryType: [Category]]() {
        didSet {
            tableView.reloadData()
        }
    }

    weak var delegate: CategoryDelegate?

    let tableHeaderHeight: CGFloat = 30

    // MARK: - Initialization

    override init() {
        super.init()

        addSubviews()
        setupTableView()
        setupSearchBar()
        fetchData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func addSubviews() {
        addSubview(searchBar)
        addSubview(tableView)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search Craigslist"
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear

        let searchTextField = searchBar.value(forKey: "_searchField") as? UITextField
        searchTextField?.backgroundColor = UIColor.customGray.withAlphaComponent(0.12)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }

    private func setupLayout() {
        searchBar.pin.left().right().top().height(10%)
        tableView.pin.below(of: searchBar).left().right().bottom().marginLeft(30).marginTop(-20)
    }

    private func fetchData() {
        var categories = [Category]()
        categories = [
            Category(name: "Activities", image: #imageLiteral(resourceName: "Activities"), type: .community),
            Category(name: "Events", image: #imageLiteral(resourceName: "Events"), type: .community),
            Category(name: "Rideshare", image: #imageLiteral(resourceName: "Rideshare"), type: .community),

            Category(name: "Accounting", image: #imageLiteral(resourceName: "Accounting"), type: .jobs),
            Category(name: "Software", image: #imageLiteral(resourceName: "Software"), type: .jobs),
            Category(name: "Education", image: #imageLiteral(resourceName: "Education"), type: .jobs),

            Category(name: "Computer", image: #imageLiteral(resourceName: "Computer"), type: .gigs),
            Category(name: "Creative", image: #imageLiteral(resourceName: "Creative"), type: .gigs),
            Category(name: "Writing", image: #imageLiteral(resourceName: "Writing"), type: .gigs),
        ]

        for type in CategoryType.allValues {
            data[type] = categories.filter { $0.type == type }
        }

        data = data.filter { $0.value.isEmpty == false }
    }

}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.delegate = self

        if let type = CategoryType(rawValue: indexPath.section), let categories = data[type] {
            cell.data = categories
        }

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = CategorySectionReusableView()

        if let type = CategoryType(rawValue: section), let categories = data[type] {
            switch categories[section].type {
            case CategoryType.community:
                sectionHeader.label.text = "Community"
            case .jobs:
                sectionHeader.label.text = "Jobs"
            case .gigs:
                sectionHeader.label.text = "Gigs"
            case .personals:
                sectionHeader.label.text = "Personals"
            case .housing:
                sectionHeader.label.text = "Housing"
            case .forsale:
                sectionHeader.label.text = "For Sale"
            case .resumes:
                sectionHeader.label.text = "Resumes"
            case .services:
                sectionHeader.label.text = "Services"
            }
        }

        return sectionHeader
    }
}

extension HomeView: UISearchBarDelegate {
    // TODO: I should add search functionality but it is a prototype...
}

extension HomeView: CategoryDelegate {
    func didSelectCategory(category: Category) {
        delegate?.didSelectCategory(category: category)
    }
}
