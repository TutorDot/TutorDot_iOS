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
    var lid: Int
    var classDate: String
    var totalHours: Int
    var currentHours: Int
    
    init(classLog: ClassLogColor, currentClass:String, lesson: String, homework: String, lid: Int, classDate: String){
        self.classLog = classLog
        self.currentClass = currentClass
        self.lesson = lesson
        self.homework = homework
        self.lid = lid
        self.classDate = classDate
        let index = currentClass.firstIndex(of: "/") ?? currentClass.endIndex
        let beginning = currentClass[..<index]
        let hourString = String(beginning)
        self.totalHours = 12
        self.currentHours = 14
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
