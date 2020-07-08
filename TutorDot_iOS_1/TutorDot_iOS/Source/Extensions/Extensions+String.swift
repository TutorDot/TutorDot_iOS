//
//  Extensions+String.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 05/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

// String Extension
extension String {

    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var date: Date? {
        return String.dateFormatter.date(from: self)
    }

    var length: Int {
        return self.count
    }
}
