//
//  MyClassCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MyClassCell: UICollectionViewCell {
    @IBOutlet weak var classColor: UIImageView!
    @IBOutlet weak var classTitle: UILabel!
    @IBOutlet weak var TuteeImage1: UIImageView!
    @IBOutlet weak var TuteeImage2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setMyClassInfo(classColor : String, classTitle: String, Tutee1:String, Tutee2:String){
        self.classColor.image = UIImage(named: classColor)
        self.classTitle.text = classTitle
        TuteeImage1.image = UIImage(named: Tutee1)
        TuteeImage2.image = UIImage(named: Tutee2)
    }
    
}
