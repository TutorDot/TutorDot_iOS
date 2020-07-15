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
    var classDate: String
    var color: String
    
    init (startTime: String, endTime: String, className: String, classHour: String, locationLabel: String, classDate: String, color: String) {
        self.startTimeLabel = startTime
        self.endTimeLabel = endTime
        self.classNameLabel = className
        self.classHourLabel = classHour
        self.locationLabel = locationLabel
        self.classDate = classDate
        self.color = color

    }


//enum ClassLogColor {
//    case yellow
//    case red
//    case green
//    case blue
//    case purple
//    
//    func getImageName() -> String {
//        switch self{
//        case .yellow:
//            return "ColorImgYellow"
//        case .red:
//            return "ColorImgRed"
//        case .green:
//            return "ColorImgGreen"
//        case .blue:
//            return "ColorImgBlue"
//        case .purple:
//            return "ColorImgPurple"
//        }
//    }
//}
}

