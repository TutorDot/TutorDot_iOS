//
//  RegularClassHoursCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/13.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDone()
    func didTapCancel()
}

class RegularClassHoursViewCell: UITableViewCell {
    
    static let identifier: String = "RegularClassHoursViewCell"
    @IBOutlet weak var classTime: UITextField!
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let datePicker = UIDatePicker()
        classTime.inputView = datePicker
        
        setTextField()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        createDatePicker()
        // Configure the view for the selected state
    }
    
    func setTextField(){
        classTime.layer.cornerRadius = 5
        classTime.placeholder = "월요일 01:00pm ~ 03:00pm"
        classTime.addLeftPadding()
    }

    func createDatePicker(){
//        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: MypageVC.view.frame.size.width, height: self.view.frame.size.height * 282/812))
//        toolbar.barStyle = UIBarStyle.default
//        toolbar.sizeToFit()
//        toolbar.largeContentTitle = "ddd"
//        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelPressed))
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//        let titleButton = UILabel()
//        titleButton.text = "수업 선택"
//        toolbar.setItems([cancelButton, titleButton, doneButton], animated: true)
//
        //self.cancelButton.title = "취소"
        //self.doneButton.title = "완료"
        //self.titleButton.title = "시간 선택"
        
//        classTime.inputAccessoryView = toolbar
//        classTime.inputView = datePicker
//        datePicker.datePickerMode = .dateAndTime
        
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        //classTime.text = formatter.string(from: datePicker.date)
        self.toolbarDelegate?.didTapDone()
    }
    @objc func cancelPressed(){
        self.toolbarDelegate?.didTapCancel()
    }
    @objc func titlePressed(){
        
    }
   
}
