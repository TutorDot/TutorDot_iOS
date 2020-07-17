//
//  AlertInfo.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/16.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import Foundation

struct AlertInfo{
    var icon: IconLog
    var noticeInfo: String
    var detail: String
    var newNotice: Bool
    
    init(icon: IconLog, noticeInfo:String, detail: String, newNotice: Bool){
        self.icon = icon
        self.noticeInfo = noticeInfo
        self.detail = detail
        self.newNotice = newNotice
        
}

enum IconLog {
    case classPencil
    case classTime
    case classMoney
    case classInfo
    
    func getImageName() -> String {
        switch self{
        case .classPencil:
            return "noticeImgClasslogYellow"
        case .classTime:
            return "noticeImgClassRed"
        case .classMoney:
            return "noticeImgMoneyGreen"
        case .classInfo:
            return "noticeImgNoticeBlue"
        }
    }
    }

}
