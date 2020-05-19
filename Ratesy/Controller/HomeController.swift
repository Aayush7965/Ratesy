//
//  HomeController.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import UIKit
import RealmSwift

class HomeController: UIViewController {
  
    fileprivate let realm = try! Realm()
    
    @IBOutlet weak var ratingButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    @IBAction func ratingButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.ratingIdentifier, sender: self)
    }
    
    //MARK:- Loading Data From Realm
    
    fileprivate func loadData() {
        let data = realm.objects(RangeModel.self)
        guard let minRange = data.last?.minValue else { return }
        guard let maxRange = data.last?.maxValue else { return }
        ratingButton.setTitle("Rating \(minRange) - \(maxRange)", for: .normal)
    }
}
