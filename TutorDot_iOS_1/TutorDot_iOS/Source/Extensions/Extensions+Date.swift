//
//  Extensions+Date.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/15.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

// Date Extension
import Foundation

extension Date {
    
    static var calendar: Calendar = {
        return Calendar(identifier: .gregorian)
    }()
    
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var lastDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var todaysDate: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    func isWeekend() -> Bool {
        return Date.calendar.isDateInWeekend(self)
    }
}
