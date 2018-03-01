//
//  ProfileView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

protocol ViewPostingsDelegate: class {
    func presentPostingsViewController()
}

protocol ViewSettingsDelegate: class {
    func presentSettingsViewController()
}

class ProfileView: BaseView {

    // MARK: - Instance properties

    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "User-1")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .customDarkGreen
        label.textAlignment = .center

        return label
    }()

    var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .customRed
        button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        button.layer.cornerRadius = 10

        return button
    }()

    var viewPostsButton: UIButton = {
        let button = UIButton()
        button.setTitle("View my postings", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .customRed
        button.addTarget(self, action: #selector(didTapViewPostingsButton), for: .touchUpInside)
        button.layer.cornerRadius = 10

        return button
    }()

    weak var viewPostingsDelegate: ViewPostingsDelegate?
    weak var viewSettingsDelegate: ViewSettingsDelegate?

    // MARK: - Initialization

    override init() {
        super.init()

        backgroundColor = .white
        addSubviews()
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
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(viewPostsButton)
        addSubview(settingsButton)
    }

    private func setupLayout() {
        userImageView.pin.topCenter().marginTop(40).size(100)
        userNameLabel.pin.below(of: userImageView, aligned: .center).width(90%).sizeToFit(.width).marginTop(8)
        viewPostsButton.pin.below(of: userNameLabel, aligned: .center).width(90%).height(8%).marginTop(40)
        settingsButton.pin.below(of: viewPostsButton, aligned: .center).width(90%).height(8%).marginTop(16)
    }

    @objc private func didTapViewPostingsButton() {
        viewPostingsDelegate?.presentPostingsViewController()
    }

    @objc private func didTapSettingsButton() {
        viewSettingsDelegate?.presentSettingsViewController()
    }
}
