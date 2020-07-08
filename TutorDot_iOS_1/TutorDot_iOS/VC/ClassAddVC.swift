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
    
    // HeaderView Setup
    
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
    @IBOutlet weak var pickerButton1: UIButton!
    @IBOutlet weak var pickerButton2: UIButton!
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
        setUpView()
    }
    
    func setUpView() {
        pickLabel.backgroundColor = UIColor.paleGrey
        pickLabel2.backgroundColor = UIColor.paleGrey
        locationTexField.backgroundColor = UIColor.paleGrey
        pickerButton1.setTitle("수정하기", for: .normal)
        pickerButton2.setTitle("수정하기", for: .normal)
        pickerButton1.tintColor = UIColor.softBlue
        pickerButton2.tintColor = UIColor.softBlue
        pickLabel.bringSubviewToFront(pickerButton1)
        pickLabel2.bringSubviewToFront(pickerButton2)
        pickLabel.addLeftPadding()
        pickLabel2.addLeftPadding()
        locationTexField.addLeftPadding()
    }
    
    // 수정 반영 버튼
    @IBAction func editButtonSelected(_ sender: Any) {
        // 데이터 추가하기
        guard let calendarVC = self.storyboard?.instantiateViewController(identifier: CalendarVC.identifier) as? CalendarVC else {return}
        print(calendarVC.classList)
        calendarVC.classList.append(Tutor(startTime: "3:00pm", endTime: "9:00pm", className: "류세화님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", colorImage: "myClassTapEditImgYellow", colorImage2: "", colorImage3: ""))
        print(calendarVC.classList)
        
        
        
    }
    
    // 수정 취소 버튼
    @IBAction func cancelButtonSelected(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "MainTab", bundle: nil)
        guard let receiveViewController = storyboard.instantiateViewController(identifier: TabbarVC.identifier) as? TabbarVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: false, completion: nil)
    }
    
    @IBAction func pickerButton(_ sender: Any) {
        expandPicker()
        pickLabel.text = "\(testPickerView.date)"
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.hour,.minute], from: self.testPickerView.date)
        
        // 서버 저장용 데이터
        let formatterForData = DateFormatter()
        formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
        
        // 레이블용 데이터
        let formatterForLabel = DateFormatter()
        formatterForLabel.dateFormat = "M월 d일 h:mm a"
        pickLabel.text = formatterForLabel.string(from: testPickerView.date)
    }
    
    
    @IBAction func pickerButton2(_ sender: Any) {
        expandPicker2()
        pickLabel2.text = "\(testPickerView2.date)"
        
        // 서버 저장용 데이터
        let formatterForData = DateFormatter()
        formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
        
        // 레이블용 데이터
        let formatterForLabel = DateFormatter()
        formatterForLabel.dateFormat = "M월 d일 h:mm a"
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
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton1.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.heightConstraint?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton1.setTitle("수정하기", for: .normal)
        }
    }
    
    func expandPicker2(){
        if isOpen == false {
            isOpen = true
            self.heightConstraint2?.constant = 180
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton2.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.heightConstraint2?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton1.setTitle("수정하기", for: .normal)
        }
    }
    
    
    

    func setListDropDown(){
        classInfoButton.setTitle("전체", for: .normal)
        dropDown = DropDown()
        dropDown?.anchorView = classInfoButton
        self.dropDown?.width = view.frame.width - 20
        DropDown.appearance().setupCornerRadius(7)
        dropDown?.backgroundColor = UIColor.white
        dropDown?.selectionBackgroundColor = UIColor.paleGrey
        
        // Top of drop down will be below the anchorView.
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["류세화학생 수학 수업", "최인정학생 영어 수업"]
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
