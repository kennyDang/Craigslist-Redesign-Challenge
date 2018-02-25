//
//  Category.swift
//  Craigslist Redesign
//
//  Created by Kenny Dang on 2/23/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

enum CategoryType: Int, EnumCollection {
    case community = 0
    case jobs
    case gigs
    case personals
    case housing
    case forsale
    case resumes
    case services
}

struct Category {
    var name: String
    var image: UIImage
    var type: CategoryType
}
