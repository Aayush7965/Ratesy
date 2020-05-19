//
//  RangeController.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit
import RealmSwift

class RangeController: UIViewController {

     @IBOutlet weak var valueLabel: UILabel!
       
       let rangeSlider = RangeSlider(frame: .zero)
       fileprivate let realm = try! Realm()
       fileprivate let newData = RangeModel()
       fileprivate var minimumRange = 1
       fileprivate var maximumRange = 7
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.addSubview(rangeSlider)
           rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged), for: .valueChanged)
       }

       override func viewDidLayoutSubviews() {
           setupSlider()
       }
       
       //MARK:- Sending Data

       @IBAction func selectedRangeTapped(_ sender: UIButton) {
           newData.maxValue = "\(maximumRange)"
           newData.minValue = "\(minimumRange)"
           saveRange(data: newData)
           performSegue(withIdentifier: K.homeIdentifier, sender: self)
       }
           
       @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
           minimumRange = rangeValue(value: rangeSlider.lowerValue)
           maximumRange = rangeValue(value: rangeSlider.upperValue)
           valueLabel.text = "\(minimumRange) - \(maximumRange)"
       }
       
       //MARK:- Saving Range to Realm
       
       fileprivate func saveRange(data: RangeModel) {
           do {
               try realm.write{
                   realm.add(data)
               }
           } catch {
               print(error)
           }
       }
}

