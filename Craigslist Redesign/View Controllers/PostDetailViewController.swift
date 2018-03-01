//
//  PostDetailViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/26/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

protocol ReplyDelegate: class {
    func presentReplyViewController()
}

class PostDetailViewController: UIViewController {

    // MARK: - Instance properties

    var post: Post

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customDarkGreen
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0

        return label
    }()

    var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customDarkGreen
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0

        return label
    }()

    var datePostedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customDarkGreen
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0

        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customDarkGreen
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.numberOfLines = 0

        return label
    }()

    var replyButton: UIButton = {
        let button = UIButton()
        button.setTitle("REPLY", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .customRed
        button.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)

        return button
    }()

    weak var delegate: ReplyDelegate?

    // MARK: - Initialization

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
        addSubViews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        titleLabel.text = post.title
        locationLabel.text = "Location     \(post.location)"
        datePostedLabel.text = "Posted        \(post.date)"
        descriptionLabel.text = post.description
    }

    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(locationLabel)
        view.addSubview(datePostedLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(replyButton)
    }

    private func setupLayout() {
        titleLabel.pin.left(5%).top().right().sizeToFit(.width)
        locationLabel.pin.below(of: titleLabel, aligned: .left).right().sizeToFit(.width).marginTop(20)
        datePostedLabel.pin.below(of: locationLabel, aligned: .left).right().sizeToFit(.width).marginTop(8)
        descriptionLabel.pin.below(of: datePostedLabel, aligned: .left).right().sizeToFit(.width).marginTop(20)
        replyButton.pin.below(of: descriptionLabel, aligned: .left).width(90%).height(8%).marginTop(40)
        replyButton.layer.cornerRadius = 5
    }

    @objc private func didTapReply() {
        delegate?.presentReplyViewController()
    }

}
