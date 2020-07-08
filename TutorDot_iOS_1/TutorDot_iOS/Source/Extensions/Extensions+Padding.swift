//
//  Extensions+Padding.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 07/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

extension UITextField{
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
      }
}
