//
//  Extensions.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit

extension RangeController {
    
    func setupSlider() {
        let margin: CGFloat = 40
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 20
        rangeSlider.frame = CGRect(x: 40, y: 286, width: width, height: height)
    }
    
    func rangeValue(value: CGFloat) -> Int {
        switch value {
        case ...0.1:
            return 0
        case ...0.2:
            return 1
        case ...0.3:
            return 2
        case ...0.4:
            return 3
        case ...0.5:
            return 4
        case ...0.6:
            return 5
        case ...0.7:
            return 6
        case ...0.8:
            return 7
        case ...0.9:
            return 8
        default:
            return 9
        }
    }
}

extension RatingController {
    
    func showError() {
        let controller = UIAlertController(title: "Error", message: "Please select a valid rating", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        controller.addAction(action)
        present(controller, animated: true)
    }
    
    func alert() {
        let controller = UIAlertController(title: "Done", message: "You have sucessfully submitted your rating", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true)
    }
    
    func rangeValue(value: CGFloat) -> Int {
        switch value {
        case ...1.0:
            return 1
        case ...2.0:
            return 2
        case ...3.0:
            return 3
        case ...4.0:
            return 4
        case ...5.0:
            return 5
        case ...6.0:
            return 6
        case ...7.0:
            return 7
        case ...8.0:
            return 8
        default:
            return 9
        }
    }
}

