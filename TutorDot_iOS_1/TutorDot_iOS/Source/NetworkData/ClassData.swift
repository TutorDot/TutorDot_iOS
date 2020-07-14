//
//  ClassData.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/13.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct ClassData: Codable{
    var status : Int
    var success : Bool
    var message : String
    var data : [CalendarData]
    
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
        data = (try? values.decode([CalendarData].self, forKey: .data)) ?? [CalendarData(classId: 1, lectureName: "", color: "", times: 0, hour: 0, location: "", date : "", startTime :"", endTime: "")]
    }
}

struct CalendarData:Codable{
    var classId:Int
    var lectureName:String
    var color: String
    var times: Int
    var hour: Int
    var location:String
    var date: String
    var startTime: String
    var endTime: String
}
