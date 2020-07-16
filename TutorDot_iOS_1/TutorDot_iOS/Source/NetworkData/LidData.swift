//
//  LidData.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/17.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct LidData: Codable {
    var status : Int
    var success : Bool
    var message : String
    var data : [LidToggleData]
    
    enum CodingKeys: String, CodingKey{
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([LidToggleData].self, forKey: .data)) ?? []
        //[CalendarData(classId: 0, lectureName: "", color: CalendarData.ClassLogColor.green, times: 0, hour: 0, location: "", classDate: "", startTime: "", endTime: "")]
    }
}

struct LidToggleData: Codable {
    var lectureId:Int
    var lectureName:String
    var color: String
    var profileUrls: [String]
    
    init (lectureId: Int, lectureName: String, color: String, profileUrls: [String]) {
        self.lectureId = lectureId
        self.lectureName = lectureName
        self.color = color
        self.profileUrls = profileUrls
        
    }

    
}
