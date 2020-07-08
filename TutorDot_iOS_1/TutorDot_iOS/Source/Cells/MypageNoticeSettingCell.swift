//
//  MypageNoticeSettingCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MypageNoticeSettingCell: UITableViewCell {
    
    static let identifier: String = "MypageNoticeSettingCell"
    var switchStatus: Bool = true
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var noticeSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSwitchUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchSelect(_ status: Bool){
        switchStatus = status
    }
    
    func setSwitchUI(){
        noticeSwitch.onTintColor = UIColor(named: "SwitchColor")
        noticeSwitch.thumbTintColor = UIColor(named: "Color")
        noticeSwitch.transform = CGAffineTransform(scaleX: 0.9, y: 0.85)
    }
    
    func setTitleInfo(_ title: String){
        self.title.text = title
    }

}
