//
//  RegularClassHoursViewCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class RegularClassHoursViewCell: UITableViewCell {
    
    static let identifier: String = "RegularClassHoursViewCell"

    @IBOutlet weak var classTimes: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        classTimes.layer.cornerRadius = 5
        classTimes.placeholder = "월요일 01:00pm ~ 03:00pm"
        classTimes.addLeftPadding()
        
        isPickerhidden(true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func timeEditDidTap(_ sender: Any) {
        isPickerhidden(false)
    }
    
    @IBAction func timeEditDidEnd(_ sender: Any) {
        isPickerhidden(true)
    }
    
    func isPickerhidden(_ status: Bool){
        if status {
            datePickerHeight.constant = 0
        } else {
            datePickerHeight.constant = 140
        }
    }
}
