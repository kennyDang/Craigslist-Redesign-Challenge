//
//  MessageTableViewCell.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/27/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class MessageTableViewCell: UITableViewCell {

    // MARK: - Instance properties

    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textColor = .customDarkGreen
        label.numberOfLines = 0

        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = UIColor.customDarkGreen.withAlphaComponent(0.5)
        label.numberOfLines = 0

        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = UIColor.customDarkGreen.withAlphaComponent(0.5)
        label.numberOfLines = 0

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
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(dateLabel)
        addSubview(messageLabel)
    }

    private func setupLayout() {
        userImageView.pin.centerLeft().size(80).marginLeft(16)
        dateLabel.pin.topRight().height(20).sizeToFit(.height).marginTop(8).marginRight(8)
        userNameLabel.pin.after(of: userImageView, aligned: .top).before(of: dateLabel).height(20).marginLeft(16)
        messageLabel.pin.after(of: userImageView)
            .below(of: userNameLabel)
            .right()
            .sizeToFit(.width)
            .marginLeft(16)
            .marginTop(8)
            .marginRight(8)
    }

}
