//
//  CustomTabBarView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class CustomTabBarView: BaseView {

    // MARK: - Instance properties

    let tabBarContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        return view
    }()

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        return view
    }()

    let separatorLine: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.18).cgColor

        return view
    }()

    let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tag = 0

        return button
    }()

    let messageButton: UIButton = {
        let homeImage = #imageLiteral(resourceName: "email")
        homeImage.withRenderingMode(.alwaysTemplate)

        let button = UIButton()
        button.setImage(homeImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .customDarkGreen
        button.tag = 1

        return button
    }()

    let profileButton: UIButton = {
        let homeImage = #imageLiteral(resourceName: "user")
        homeImage.withRenderingMode(.alwaysTemplate)

        let button = UIButton()
        button.setImage(homeImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .customDarkGreen
        button.tag = 2

        return button
    }()

    // MARK: - Initalization

    override init() {
        super.init()

        addSubViews()
        setupButtons()
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
        addSubview(contentView)
        addSubview(tabBarContainerView)

        tabBarContainerView.addSubview(separatorLine)
        tabBarContainerView.addSubview(homeButton)
        tabBarContainerView.addSubview(messageButton)
        tabBarContainerView.addSubview(profileButton)
    }

    private func setupButtons() {
        homeButton.addTarget(self, action: #selector(didSelectHomeButton), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(didSelectMessageButton), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(didSelectProfileButton), for: .touchUpInside)
    }

    @objc private func didSelectHomeButton() {

    }

    @objc private func didSelectMessageButton() {

    }

    @objc private func didSelectProfileButton() {

    }

    private func setupLayout() {
        tabBarContainerView.pin.left().right().bottom().height(49)
        separatorLine.pin.left().right().height(1).top()
        messageButton.pin.size(25).center()
        homeButton.pin.size(25).before(of: messageButton, aligned: .center).marginRight(100)
        profileButton.pin.size(25).after(of: messageButton, aligned: .center).marginLeft(100)
        contentView.pin.left().right().top().bottom(to: tabBarContainerView.edge.top)
    }

}
