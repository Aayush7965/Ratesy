//
//  HistoryManager.swift
//  Ratesy
//
//  Created by Aayush Pareek on 19/05/20.
//  Copyright © 2020 Aayush Pareek. All rights reserved.
//

import Foundation

struct HistoryManager {
    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateTimeString = formatter.string(from: date)
        return dateTimeString
    }

    func getTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateTimeString = formatter.string(from: date)
        return dateTimeString
    }
}

