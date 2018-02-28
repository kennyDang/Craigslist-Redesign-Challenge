//
//  CategoryDetailTableViewCell.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/24/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class PostCollectionViewCell: UICollectionViewCell {

    // MARK: - Instance properties

    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customRed
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)

        return label
    }()

    let postingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0

        return label
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        addSubViews()
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
        addSubview(dateLabel)
        addSubview(postingTitleLabel)
    }

    private func setupLayout() {
        dateLabel.pin.left(16).top().right().height(20)
        postingTitleLabel.pin.below(of: dateLabel, aligned: .left).right().sizeToFit(.width).marginTop(8)
    }

    func configure(post: Post) {
        dateLabel.text = post.date
        postingTitleLabel.text = post.title

        setNeedsLayout()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        setupLayout()

        return CGSize(width: contentView.frame.width, height: postingTitleLabel.frame.maxY + dateLabel.frame.maxY + 40)
    }
}
