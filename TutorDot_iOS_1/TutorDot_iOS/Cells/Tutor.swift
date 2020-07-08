//
//  CalendarCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 03/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import UIKit

struct Tutor {
    var startTimeLabel: String
    var endTimeLabel: String
    var classNameLabel: String
    var classHourLabel: String
    var locationLabel: String
    var colorImage: UIImage?
    var colorImage2: UIImage?
    var colorImage3: UIImage?
    
    init (startTime: String, endTime: String, className: String, classHour: String, locationLabel: String, colorImage: String, colorImage2: String, colorImage3: String) {
        self.startTimeLabel = startTime
        self.endTimeLabel = endTime
        self.classNameLabel = className
        self.classHourLabel = classHour
        self.locationLabel = locationLabel
        self.colorImage = UIImage(named: colorImage)
        self.colorImage2 = UIImage(named: colorImage2)
        self.colorImage3 = UIImage(named: colorImage3)
    }
    
}
