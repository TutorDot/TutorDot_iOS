//
//  PickerViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 05/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

import UIKit
// 변수가 한개인 추천상품 구조체 생성
struct PickerViewCell {
    var startDateLabel: String
    var open = false



    init(startDateLabel: String) {
        self.startDateLabel = startDateLabel
}
}
    
