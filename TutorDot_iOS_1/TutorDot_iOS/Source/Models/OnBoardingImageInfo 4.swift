//
//  OnBoardingImageInfo.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/11.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import UIKit

struct OnBoardingImageInfo {
    var image1: UIImage?
    
    init (image1: String) {
        self.image1 = UIImage(named: image1)
    }
    
}
