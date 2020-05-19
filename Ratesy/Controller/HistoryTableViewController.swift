//
//  HistoryTableViewController.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//


import UIKit
import RealmSwift

class HistoryTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var ratingModels: Results<RatingModel>?
    let tableViewManager = HistoryManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
        self.scrollToBottom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratingModels?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! HistoryCell
        if let model = ratingModels?[indexPath.row] {
            if let dateCreated = model.dateCreated {
                let dateString = tableViewManager.getDate(date: dateCreated)
                let timeString = tableViewManager.getTime(date: dateCreated)
                cell.dateLabel.text = dateString
                cell.timeLabel.text = timeString
            }
            cell.ratingLabel.text = model.rating
            cell.rangeLabel.text = "\(model.ratingRange)"
        }
        return cell
    }
    
    fileprivate func scrollToBottom() {
        DispatchQueue.main.async {
            let model = self.ratingModels?.count
            if model != 0 {
                let indexPath = IndexPath(row: model! - 1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            } else {
                return
            }
        }
    }
    
    //MARK:- Loading Data From Realm
    
    fileprivate func loadData() {
        ratingModels = realm.objects(RatingModel.self)
        tableView.reloadData()
    }
}
