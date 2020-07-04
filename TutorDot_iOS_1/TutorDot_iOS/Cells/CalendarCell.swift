//
//  CalendarCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 03/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct CalendarCell {
    var startTimeLabel: String
    var endTimeLabel: String
    var classNameLabel: String
    var classHourLabel: String
    var locationLabel: String
    var colorImage: Bool
    
    init (startTime: String, endTime: String, className: String, classHour: String, locationLabel: String, colorImage: Bool) {
        self.startTimeLabel = startTime
        self.endTimeLabel = endTime
        self.classNameLabel = className
        self.classHourLabel = classHour
        self.locationLabel = locationLabel
        self.colorImage = colorImage
    }
    
}
