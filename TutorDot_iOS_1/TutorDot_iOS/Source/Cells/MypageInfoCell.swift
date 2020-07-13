//
//  MypageInfoCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MypageInfoCell: UITableViewCell {

    static let identifier: String = "MypageInfoCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var versionLabel : UILabel!
    func setVersionLabel(){
        versionLabel = UILabel(frame : CGRect(x: 302, y: 18, width: 60, height: 19))
        versionLabel.text = "1 . 0 . 0"
        versionLabel.textColor = UIColor.brownishGrey2
        
        self.addSubview(versionLabel)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func hiddenButton(){
        button.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTitleInfo(_ title: String){
        self.title.text = title
    }
    
}
