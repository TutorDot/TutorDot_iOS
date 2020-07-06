//
//  NotesInfo.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/05.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct NotesInfo{
    var classLog: ClassLogColor
    var currentClass: String
    var lesson: String
    var homework: String
    
    init(classLog: ClassLogColor, currentClass:String, lesson: String, homework: String){
        self.classLog = classLog
        self.currentClass = currentClass
        self.lesson = lesson
        self.homework = homework
    }
}

enum ClassLogColor {
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
