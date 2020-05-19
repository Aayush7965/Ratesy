//
//  RangeModel.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit
import RealmSwift

class RangeModel: Object {
    @objc dynamic var minValue: String = ""
    @objc dynamic var maxValue: String = ""
}
