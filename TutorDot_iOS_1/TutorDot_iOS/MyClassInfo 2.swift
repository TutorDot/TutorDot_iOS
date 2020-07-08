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
    
    init(classColor: ClassColors, classTitle:String, tutee1: String, tutee2: String){
        self.classColor = classColor
        self.classTitle = classTitle
        self.tutee1 = tutee1
        self.tutee2 = tutee2
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
            return "ColorImgYellow"
        case .red:
            return "ColorImgRed"
        case .green:
            return "ColorImgGreen"
        case .blue:
            return "ColorImgBlue"
        case .purple:
            return "ColorImgPurple"
        }
    }
}
