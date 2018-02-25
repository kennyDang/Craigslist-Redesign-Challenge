//
//  CategoryTableViewCell.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

protocol CategoryDelegate: class {
    func didSelectCategory(category: Category)
}

class CategoryTableViewCell: UITableViewCell {

    // MARK: - Instance properties

    let collectionView: UICollectionView = {
        let width = UIScreen.main.bounds.width / 3

        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: width, height: width)
        flow.minimumLineSpacing = 20

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear

        return collectionView
    }()

    var data = [Category]() {
        didSet {
            collectionView.reloadData()
        }
    }

    weak var delegate: CategoryDelegate?

    // MARK: - Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubViews()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func addSubViews() {
        addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.pin.all()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension CategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }

        let category = data[indexPath.row]
        cell.imageView.image = category.image
        cell.label.text = category.name

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCategory(category: data[indexPath.row])
    }
}
