//
//  ClassAddVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 04/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown

class ClassAddVC: UIViewController {

    static let identifier: String = "ClassAddVC"
    
    // DropDown Setup
    @IBOutlet weak var classInfoButton: UIButton!
    @IBOutlet weak var classInfoImage:
    UIImageView!
    @IBOutlet weak var dropDownButton: UIButton!
    var dropDown:DropDown?
    
     // PickerView Setup
    @IBOutlet weak var testPickerView: UIDatePicker!
    @IBOutlet weak var testPickerView2: UIDatePicker!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var pickLabel: UITextField!
    @IBOutlet weak var pickLabel2: UITextField!
    var isOpen = false
    
    @IBOutlet weak var locationTexField: UITextField!
    
    func setTimeZone() {
        testPickerView.timeZone = .current
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setListDropDown()
        showPicker(false)
        showPicker2(false)
        setTimeZone()
        setUpLabel()
    }

    @IBAction func pickerButton(_ sender: Any) {
        expandPicker()
        pickLabel.text = "\(testPickerView.date)"
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.hour,.minute], from: self.testPickerView.date)
//        calendar.dateComponents([.day,.month,.hour,.minute], from: self.testPickerView.date)
//        let day = components.day
//        let month = components.month
//        let year = components.year
////
//        testPickerView2.select(month!)
        
//        testPickerView2.selectRow(month!-1, inComponent: 0, animated: true)
//        testPickerView2.selectRow(day!-1, inComponent: 1, animated: true)
//        pickerView.selectRow(year!-1, inComponent: 2, animated: true)
        
        // 서버 저장용 데이터
        let formatterForData = DateFormatter()
        formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
        
        // 레이블용 데이터
        let formatterForLabel = DateFormatter()
        formatterForLabel.dateFormat = "MM/dd/hh:mm"
        pickLabel.text = formatterForLabel.string(from: testPickerView.date)
    }
    
    
    @IBAction func pickerButton2(_ sender: Any) {
        expandPicker2()
                pickLabel2.text = "\(testPickerView2.date)"
//                let calendar = Calendar.current
//                let components = calendar.dateComponents([.day,.month,.hour,.minute], from: self.testPickerView2.date)
//                calendar.dateComponents([.day,.month,.hour,.minute], from: self.testPickerView2.date)
        
        //        let day = components.day
        //        let month = components.month
        //        let year = components.year
                
        //        pickerView.selectRow(month!-1, inComponent: 0, animated: true)
        //        pickerView.selectRow(day!-1, inComponent: 1, animated: true)
        //        pickerView.selectRow(year!-1, inComponent: 2, animated: true)
                
                // 서버 저장용 데이터
                let formatterForData = DateFormatter()
                formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
                
                // 레이블용 데이터
                let formatterForLabel = DateFormatter()
                formatterForLabel.dateFormat = "MM/dd/hh:mm"
                pickLabel2.text = formatterForLabel.string(from: testPickerView2.date)
        
    }
    
    func showPicker(_ show:Bool) {
        self.heightConstraint?.constant = show ? 200 : 0
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showPicker2(_ show:Bool) {
        self.heightConstraint2?.constant = show ? 200 : 0
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    func expandPicker(){
        if isOpen == false {
            isOpen = true
            self.heightConstraint?.constant = 180
            UIView.animate(withDuration: 1.0) {
                self.view.layoutIfNeeded()
            }
        } else {
            isOpen = false
            self.heightConstraint?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func expandPicker2(){
        if isOpen == false {
            isOpen = true
            self.heightConstraint2?.constant = 180
            UIView.animate(withDuration: 1.0) {
                self.view.layoutIfNeeded()
            }
        } else {
            isOpen = false
            self.heightConstraint2?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func setUpLabel() {
        pickLabel.backgroundColor = UIColor.paleGrey
        pickLabel2.backgroundColor = UIColor.paleGrey
        locationTexField.backgroundColor = UIColor.paleGrey
        
    }
    

    func setListDropDown(){
        classInfoButton.setTitle("전체", for: .normal)
        dropDown = DropDown()
        dropDown?.anchorView = classInfoButton
        self.dropDown?.width = view.frame.width - 20
        DropDown.appearance().setupCornerRadius(7)
        dropDown?.backgroundColor = UIColor.white
        
        // Top of drop down will be below the anchorView.
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        //dropDown?.
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "류세화학생 수학 수업", "최인정학생 영어 수업"]
        dropDownButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.classInfoButton.setTitle(item, for: .normal)
            
        }

        // 드롭박스 내 text 가운데 정렬
        dropDown?.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            // Setup your custom UI components
            cell.optionLabel.textAlignment = .center
        }
    }
    
    @objc func dropDownToggleButton(){
        dropDown?.show()
    }
    
}
