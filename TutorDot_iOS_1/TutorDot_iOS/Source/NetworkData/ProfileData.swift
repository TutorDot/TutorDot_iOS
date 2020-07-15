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
    var data: [UserProfile]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case data = "data"
    }
    
    init(form decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        data = (try? values.decode([UserProfile].self, forKey: .data)) ?? []
    }
}

struct UserProfile: Codable {
    var userName: String
    var role: String
    var intro: String
    var profileURL: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case role = "role"
        case intro = "intro"
        case profileURL = "profileUrl"
        
    }
    
    init(form decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userName = (try? values.decode(String.self, forKey: .userName)) ?? ""
        role = (try? values.decode(String.self, forKey: .role)) ?? ""
        intro = (try? values.decode(String.self, forKey: .intro)) ?? ""
        profileURL = (try? values.decode(String.self, forKey: .profileURL)) ?? ""
    }
}
