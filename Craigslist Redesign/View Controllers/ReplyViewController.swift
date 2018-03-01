//
//  ReplyViewController.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/28/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

protocol FinishedFlowDelegate: class {
    func didFinishFlow()
}

class ReplyViewController: UIViewController {

    // MARK: - Instance properties

    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .customDarkGreen
        textView.font = UIFont.systemFont(ofSize: 18)

        return textView
    }()

    weak var delegate: FinishedFlowDelegate?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(messageTextView)
        view.backgroundColor = .white

        setupNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupLayout()
    }

    // MARK: - Setup

    private func setupLayout() {
        messageTextView.pin.all().margin(8)
    }

    private func setupNavigationBar() {
        let rightButtonItem = UIBarButtonItem(title: "Send", style: .done, target: self, action: #selector(didTapSend))

        title = "New Message"
        navigationItem.rightBarButtonItem = rightButtonItem
    }

    @objc private func didTapSend() {
        delegate?.didFinishFlow()
    }

}
