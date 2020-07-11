//
//  NetworkResult.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/11.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
