//
//  SettingTableViewCell.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/28/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class SettingTableViewCell: UITableViewCell {

    // MARK: - Instance properties

    let settingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customDarkGreen
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textAlignment = .left

        return label
    }()

    let rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "right-arrow")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    // MARK: - Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white
        addSubview(settingsLabel)
        addSubview(rightArrowImageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func setupLayout() {
        settingsLabel.pin.centerLeft().height(20%).sizeToFit(.height).marginLeft(20)
        rightArrowImageView.pin.size(25).centerRight().marginRight(32)
    }

}
