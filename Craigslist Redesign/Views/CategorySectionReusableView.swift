//
//  CategoryCollectionReusableView.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit
import PinLayout

class CategorySectionReusableView: UIView {

    let label: UILabel = {
        let label = UILabel()
        label.textColor = .customRed
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    private func addSubViews() {
        addSubview(label)
    }

    private func setupLayout() {
        label.pin.centerLeft().width(100%).sizeToFit(.heightFlexible)
    }
}
