//
//  RegularClassHoursCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/13.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class RegularClassHoursViewCell: UITableViewCell {
    
    static let identifier: String = "RegularClassHoursViewCell"
    
    @IBOutlet weak var classTime: UITextField!
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTextField()
        createDatePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

    }
    
    func setTextField(){
        classTime.layer.cornerRadius = 5
        classTime.placeholder = "월요일 01:00pm ~ 03:00pm"
        classTime.addLeftPadding()
    }
    
    func createDatePicker(){
       
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelPressed))
        toolbar.setItems([doneButton, cancelButton], animated: true)
        classTime.inputAccessoryView = toolbar
        classTime.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        classTime.text = formatter.string(from: datePicker.date )
        toolbar.endEditing(true)
    }
    @objc func cancelPressed(){
        
    }
}


