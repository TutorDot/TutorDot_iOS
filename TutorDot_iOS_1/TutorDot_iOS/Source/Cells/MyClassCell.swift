//
//  MyClassCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

protocol MyClassCellDelegate: class {
    func getRole() -> String
    func setRole()
}

class MyClassCell: UICollectionViewCell {
    static let identifier: String = "MyClassCell"
    var delegate: MyClassCellDelegate?
    var myRoleSet: String? = ""
    
    @IBOutlet weak var myClassView: UIView!
    @IBOutlet weak var classColor: UIImageView!
    @IBOutlet weak var classTitle: UILabel!
    @IBOutlet weak var TuteeImage1: UIImageView!
    @IBOutlet weak var TuteeImage2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myClassView.layer.cornerRadius = 7
    }
    
    func setMyClassInfo(classColor : String, classTitle: String, Tutee1:String, Tutee2:String, role: String){
        self.classColor.image = UIImage(named: classColor)
        self.classTitle.text = classTitle
        TuteeImage1.image = UIImage(named: Tutee1)
        TuteeImage2.image = UIImage(named: Tutee2)
        myRoleSet = role
    }
    
}
