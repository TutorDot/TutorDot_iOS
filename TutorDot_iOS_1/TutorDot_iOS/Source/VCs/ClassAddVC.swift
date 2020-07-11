//
//  ClassAddVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 04/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown

class ClassAddVC: UIViewController, UIGestureRecognizerDelegate {

    static let identifier: String = "ClassAddVC"
    
    // HeaderView Setup
    
    // DropDown Setup
    @IBOutlet weak var classInfoButton: UIButton!
    @IBOutlet weak var classInfoImage:
    UIImageView!
    @IBOutlet weak var dropDownButton: UIButton!
    var dropDown:DropDown?
    
    @IBOutlet weak var anchorView: UIView!
    
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
    
    @IBOutlet weak var startTimeToClassLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
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
        initGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) { //
        registerForKeyboardNotifications()
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
        
        anchorView.frame.size.width = self.view.frame.size.width / 1.2
    }
    
    // 수정 반영 버튼
    @IBAction func editButtonSelected(_ sender: Any) {
        // 데이터 추가하기
        guard let calendarVC = self.storyboard?.instantiateViewController(identifier: CalendarVC.identifier) as? CalendarVC else {return}
        print(calendarVC.classList)
        calendarVC.classList.append(Tutor(startTime: "3:00pm", endTime: "9:00pm", className: "류세화님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", colorImage: "myClassTapEditImgYellow", colorImage2: "", colorImage3: ""))
        print(calendarVC.classList)
        
        // 위치 정보 비어있을 경우
        if locationTexField.text!.isEmpty {
            let alert = UIAlertController(title: "일정추가 실패", message: "일정 정보를 모두 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
        
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
            //pickerButton1.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.heightConstraint?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            //pickerButton1.setTitle("수정하기", for: .normal)
        }
    }
    
    func expandPicker2(){
        if isOpen == false {
            isOpen = true
            self.heightConstraint2?.constant = 180
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            //pickerButton2.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.heightConstraint2?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            //pickerButton1.setTitle("수정하기", for: .normal)
        }
    }
    

    func setListDropDown(){
        classInfoButton.setTitle("류세화학생 수학 수업", for: .normal)
        dropDown = DropDown()
        dropDown?.anchorView = anchorView
        self.dropDown?.width = anchorView.frame.size.width
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
            cell.optionLabel.textAlignment = .left
        }
    }
    
    @objc func dropDownToggleButton(){
        dropDown?.show()
    }
    
    
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) { //
        self.locationTexField.resignFirstResponder()

    }
    
    func registerForKeyboardNotifications() { //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 키보드가 생길 떄 텍스트 필드 위로 밀기
    @objc func keyboardWillShow(_ notification: NSNotification) { //
           
           guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
           guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
           
           guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
           
           let keyboardHeight: CGFloat // 키보드의 높이
           
           if #available(iOS 11.0, *) {
               keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
           } else {
               keyboardHeight = keyboardFrame.cgRectValue.height
           }
           
           // animation 함수
           // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
           // duration은 간격
           UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
               
            self.classInfoButton.alpha = 0
            self.classInfoImage.alpha = 0
            self.dropDownButton.alpha = 0
               
               // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.startTimeToClassLabelConstraint.constant = 0
            self.bottomConstraint.constant = +keyboardHeight/2 + 100
           })
           
           self.view.layoutIfNeeded()
       }
    
    // 키보드가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) { //
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.classInfoButton.alpha = 1.0
            self.classInfoImage.alpha = 1.0
            self.dropDownButton.alpha = 1.0
            
            self.startTimeToClassLabelConstraint.constant = 25
            self.bottomConstraint.constant = 30
        })
        
        self.view.layoutIfNeeded()
    }
    
}
