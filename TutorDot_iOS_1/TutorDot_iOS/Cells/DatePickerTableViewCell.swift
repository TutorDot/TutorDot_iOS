//
//  DatePickerTableViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 05/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {
    static let identifier: String = "DatePickerTableViewCell"
    
    @IBOutlet weak var startPickerView: UIDatePicker!
    
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        // Update label in the cell above
        //HeaderTableViewCell.startDateLabel.text = "\(startPickerView.date)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        startPickerView.date = Date()
        //HeaderTableViewCell.startDateLabel.text = "\(startPickerView.date)"
        // my label in cell above
        //startPickerView.isHidden = true
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
