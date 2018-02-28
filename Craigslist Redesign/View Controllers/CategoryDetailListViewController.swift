//
//  CategoryDetailListViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/24/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

protocol PostDelegate: class {
    func didSelect(post: Post)
}

class CategoryDetailListViewController: UIViewController {

    // MARK: - Instance properties

    var category: Category

    var cellTemplate = PostCollectionViewCell()

    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 20

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow)
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true

        return collectionView
    }()

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()

        return searchBar
    }()

    var data = [Post]() {
        didSet {
            collectionView.reloadData()
        }
    }

    weak var delegate: PostDelegate?

    // MARK: - Initialization

    init(category: Category) {
        self.category = category

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupNavigationBar()
        addSubViews()
        setupSearchBar()
        setupCollectionView()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.view.backgroundColor = UIColor.clear
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        navigationItem.title = category.name
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addSubViews() {
        view.addSubview(collectionView)
        view.addSubview(searchBar)
    }

    private func setupLayout() {
        searchBar.pin.left().right().top().height(10%)
        collectionView.pin.below(of: searchBar).left().right().bottom()
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search \(category.name)"
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear

        let searchTextField = searchBar.value(forKey: "_searchField") as? UITextField
        searchTextField?.backgroundColor = UIColor.customGray.withAlphaComponent(0.12)
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func fetchData() {
        data = [Post(title: Placeholder.TITLE, description: Placeholder.DESCRIPTION, date: "Feb 20", location: Placeholder.LOCATION),
                Post(title: Placeholder.TITLE2, description: Placeholder.DESCRIPTION, date: "Feb 21", location: Placeholder.LOCATION),
                Post(title: Placeholder.TITLE2, description: Placeholder.DESCRIPTION, date: "Feb 22", location: Placeholder.LOCATION),
                Post(title: Placeholder.TITLE, description: Placeholder.DESCRIPTION, date: "Feb 23", location: Placeholder.LOCATION),
                Post(title: Placeholder.TITLE2, description: Placeholder.DESCRIPTION, date: "Feb 24", location: Placeholder.LOCATION)]
    }

}

extension CategoryDetailListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier, for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(post: data[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        cellTemplate.configure(post: data[indexPath.row])

        return cellTemplate.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
    }
}

extension CategoryDetailListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(post: data[indexPath.row])
    }
}

extension CategoryDetailListViewController: UISearchBarDelegate {
    
}
