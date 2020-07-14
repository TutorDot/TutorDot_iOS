//
//  SignUpData.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/12.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
struct SignUpData: Codable {
    
    var status: Int
    var success: Bool
    var message: String
    
    enum CodingKeys: String, CodingKey{
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
