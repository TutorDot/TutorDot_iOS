//
//  Extentions+UITextField.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/13.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation

extension UITextField {

    var isEmpty: Bool {
        if let text = textField.text, !text.isEmpty {
             return false
        }
        return true
    }
}
