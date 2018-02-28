//
//  CustomTabBarView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

protocol CustomTabBarDelegate: class {
    func customTabBarDidSelect(button: UIButton)
}

class CustomTabBarView: BaseView {

    // MARK: - Instance properties

    let safeAreaContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        return view
    }()

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
        let homeImage = #imageLiteral(resourceName: "home")
        homeImage.withRenderingMode(.alwaysOriginal)

        let button = UIButton(type: .system)
        button.setImage(homeImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tag = 0
        button.tintColor = .customRed

        return button
    }()

    let messageButton: UIButton = {
        let messageImage = #imageLiteral(resourceName: "email")
        messageImage.withRenderingMode(.alwaysOriginal)

        let button = UIButton(type: .system)
        button.setImage(messageImage, for: .normal)
        button.tintColor = .customDarkGreen
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .customDarkGreen
        button.tag = 1

        return button
    }()

    let profileButton: UIButton = {
        let profileImage = #imageLiteral(resourceName: "user")
        profileImage.withRenderingMode(.alwaysOriginal)

        let button = UIButton(type: .system)
        button.setImage(profileImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .customDarkGreen
        button.tag = 2

        return button
    }()

    weak var delegate: CustomTabBarDelegate?

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
        addSubview(safeAreaContainerView)
        safeAreaContainerView.addSubview(contentView)
        safeAreaContainerView.addSubview(tabBarContainerView)

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
        delegate?.customTabBarDidSelect(button: homeButton)
        resetColor()
        homeButton.tintColor = .customRed
    }

    @objc private func didSelectMessageButton() {
        delegate?.customTabBarDidSelect(button: messageButton)
        resetColor()
        messageButton.tintColor = .customRed
    }

    @objc private func didSelectProfileButton() {
        delegate?.customTabBarDidSelect(button: profileButton)
        resetColor()
        profileButton.tintColor = .customRed
    }

    private func resetColor() {
        profileButton.tintColor = .customDarkGreen
        homeButton.tintColor = .customDarkGreen
        messageButton.tintColor = .customDarkGreen
    }

    private func setupLayout() {
        safeAreaContainerView.pin.all().margin(safeArea)
        tabBarContainerView.pin.left().right().bottom().height(49)
        separatorLine.pin.left().right().height(1).top()
        messageButton.pin.size(25).center()
        homeButton.pin.size(25).before(of: messageButton, aligned: .center).marginRight(100)
        profileButton.pin.size(25).after(of: messageButton, aligned: .center).marginLeft(100)
        contentView.pin.left().right().top().bottom(to: tabBarContainerView.edge.top)
    }

}
