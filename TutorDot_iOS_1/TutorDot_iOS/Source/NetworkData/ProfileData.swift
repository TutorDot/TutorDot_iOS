//
//  ProfileData.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/14.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

struct ProfileData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: UserProfile?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(form decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(UserProfile.self, forKey: .data)) ?? nil
    }
}

struct UserProfile: Codable {
    var userName: String
    var role: String
    var intro: String
    var profileURL: String
}
