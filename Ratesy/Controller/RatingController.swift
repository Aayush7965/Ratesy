//
//  RatingController.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit
import RealmSwift

class RatingController: UIViewController {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    
    let realm = try! Realm()
    var minValue: Float = 0
    var maxValue: Float = 9
    
    var ratingString: String = ""
    var ratingRange: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingLabel.isHidden = true
        loadData()
    }
    
    fileprivate func loadData() {
        let data = realm.objects(RangeModel.self)
        guard let value = data.last else {return}
        let minimumValue = value.minValue
        let maximumValue = value.maxValue
        minValue = (minimumValue as NSString).floatValue
        maxValue = (maximumValue as NSString).floatValue
        ratingSlider.minimumValue = minValue
        ratingSlider.maximumValue = maxValue
        ratingRange = "Rating range \(minimumValue) - \(maximumValue)"
        minLabel.text = minimumValue
        maxLabel.text = maximumValue
    }
    
    //MARK:- Sending Data
    
    @IBAction func sliderOutlet(_ sender: UISlider) {
        
        
        ratingLabel.isHidden = false
        let returnValue = rangeValue(value: CGFloat(sender.value))
        ratingLabel.text = "\(returnValue)"
        ratingString = "\(returnValue)"
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if ratingString != "" {
            saveData()
            ratingSlider.value = minValue
            ratingString = "\(Int(minValue))"
            ratingLabel.text = String(format: "%.0f", minValue)
            alert()
        } else {
            showError()
            return
        }
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    //MARK:- Saving Realm Data
    
    fileprivate func saveData() {
        do {
            try self.realm.write {
                let newValue = RatingModel()
                newValue.dateCreated = Date()
                newValue.rating = ratingString
                newValue.ratingRange = ratingRange
                realm.add(newValue)
            }
        } catch {
            print("Error saving new items, \(error)")
        }
    }
}
