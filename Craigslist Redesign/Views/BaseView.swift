//
//  BaseView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/22/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class BaseView: UIView {

    // MARK: - Instance properties

    private var legacySafeArea: UIEdgeInsets = .zero

    var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return safeAreaInsets
        } else {
            return legacySafeArea
        }
    }

    // MARK: - Initialzation

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setSafeArea(_ safeArea: UIEdgeInsets) {
        guard safeArea != self.safeArea else { return }
        legacySafeArea = safeArea
        safeAreaDidChange()
    }

    func safeAreaDidChange() {
        setNeedsLayout()
    }

    override func safeAreaInsetsDidChange() {
        safeAreaDidChange()
    }
}
