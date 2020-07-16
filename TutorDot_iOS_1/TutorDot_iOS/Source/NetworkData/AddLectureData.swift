//
//  AddLectureData.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/16.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct AddLectureData: Codable {
    //POST : 마이페이지 뷰 수업추가 버튼 클릭 시 Response 정의
    var status: Int
    var success: Bool
    var message: String
    
      
      
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }
      
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}



