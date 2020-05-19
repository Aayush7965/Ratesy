//
//  RatingModel.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit
import RealmSwift

class RatingModel: Object {
    @objc dynamic var rating: String = ""
    @objc dynamic var ratingRange: String = ""
    @objc dynamic var dateCreated: Date?
}

