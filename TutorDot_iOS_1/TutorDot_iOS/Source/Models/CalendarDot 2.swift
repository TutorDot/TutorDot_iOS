//
//  CalendarDot.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 07/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import UIKit

struct CalendarDot {
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    
    init (image1: String, image2: String, image3: String) {
        self.image1 = UIImage(named: image1)
        self.image2 = UIImage(named: image2)
        self.image3 = UIImage(named: image3)
    }
    
}
