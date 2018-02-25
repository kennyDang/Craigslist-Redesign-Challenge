//
//  CategoryDetailTableViewCell.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/24/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class PostTableViewCell: UITableViewCell {

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

        return label
    }()

    // MARK: - Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
        dateLabel.pin.left().top().right().height(20)
        postingTitleLabel.pin.below(of: dateLabel).left().right().bottom()
    }
}
