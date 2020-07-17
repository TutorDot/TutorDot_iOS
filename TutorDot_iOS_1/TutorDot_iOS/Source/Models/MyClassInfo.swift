//
//  MyClassInfo.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct MyClassInfo {
    var classColor: ClassColors
    var classTitle: String
    var tutee1: String
    var tutee2: String
    var role: String
    
    init(classColor: ClassColors, classTitle:String, tutee1: String, tutee2: String, role: String){
        self.classColor = classColor
        self.classTitle = classTitle
        self.tutee1 = tutee1
        self.tutee2 = tutee2
        self.role = role
    }
}

enum ClassColors {
    case yellow
    case red
    case green
    case blue
    case purple
    
    func getImageName() -> String {
        switch self{
        case .yellow:
            return "yellow"
        case .red:
            return "red"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .purple:
            return "purple"
        }
    }
}
