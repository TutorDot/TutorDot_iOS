//
//  ClassInfoVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 03/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import UIKit

class ClassInfoVC: UIViewController, UIGestureRecognizerDelegate {

    static let identifier: String = "ClassInfoVC"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addCancelButton: UIButton!
    


    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    // PickerView
    
    let pickerView = UIPickerView()
    let pickerView2 = UIPickerView()
    let toolbar = UIToolbar()
    let weekdays: [String] = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    let startHours: [String] = ["01", "02", "03", "04", "05", "06","07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let startMins: [String] = ["00", "01", "02", "03", "04", "05", "06","07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let endHours: [String] =  ["00","30"]
    
    
    var days: String = ""
    var startH: String = ""
    var startM: String = ""
    var endH: String = ""
    var endM: String = ""
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var startTimeToClassLabelConstraint: NSLayoutConstraint!
    
    var isOpen = false
    var editClicked = false
    
    var tutorCollectionViewCellInstance: TutorCollectionViewCell?
    var classNameHeader: String?
    var classNameBody: String = ""
    var classImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        initGestureRecognizer()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        createDatePicker2()
        createDatePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) { //
        registerForKeyboardNotifications()
    }
    
    func setUpView() {
        //pickerButton1.setTitle("수정", for: .normal)
        classLabel.text = classNameBody
        startTextField.backgroundColor = UIColor.paleGrey
        endTextField.backgroundColor = UIColor.paleGrey
        locationTextField.backgroundColor = UIColor.paleGrey
        startTextField.addLeftPadding()
        endTextField.addLeftPadding()
        locationTextField.addLeftPadding()
        startTextField.textColor = UIColor.brownishGrey
        endTextField.textColor = UIColor.brownishGrey
        locationTextField.textColor = UIColor.brownishGrey
    }

    
    // 확인 버튼 클릭시 전 뷰컨으로 돌아가기
    // 데이터 받아오기
    @IBAction func editButtonSelected(_ sender: UIButton) {
        
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle:nil)
        guard let controller = calendarStoryboard.instantiateViewController(withIdentifier: ClassEditVC.identifier) as? ClassEditVC else { return }
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
        
        // 데이터 ClassEditVC에 다시 보내주기
        if let className = self.classLabel.text {
            controller.classHeaderLabel.text = className
            controller.classLabel.text = className
        }
        if let startHour = self.startTextField.text {
            controller.startTextField.text = startHour
        }
        
        if let endHour = self.endTextField.text {
            controller.endTextField.text = endHour
        }
        
        if let location = self.locationTextField.text {
            controller.locationTextField.text = location
        }
        
        if let image = self.imageLabel.image {
            controller.classImage.image = image
        }
        
        if locationTextField.text!.isEmpty {
            let alert = UIAlertController(title: "일정추가 실패", message: "일정 정보를 모두 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    
    }
    
    // 취소 버튼 클릭 시 ClassEditVC로 그냥 돌아오기
    @IBAction func editCancelButton(_ sender: Any) {
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle:nil)
        guard let controller = calendarStoryboard.instantiateViewController(withIdentifier: ClassEditVC.identifier) as? ClassEditVC else { return }
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    
        
        // 데이터 ClassEditVC에 다시 보내주기
        if let className = self.classLabel.text {
            controller.classHeaderLabel.text = className
            controller.classLabel.text = className
        }
        if let startHour = self.startTextField.text {
            controller.startTextField.text = startHour
        }
        
        if let endHour = self.endTextField.text {
            controller.endTextField.text = endHour
        }
        
        if let location = self.locationTextField.text {
            controller.locationTextField.text = location
        }
        
        if let image = self.imageLabel.image {
            controller.classImage.image = image
        }
    }
    
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) { //
        self.locationTextField.resignFirstResponder()

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
               
               self.classLabel.alpha = 0
            self.imageLabel.alpha = 0
               
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
            self.classLabel.alpha = 1.0
            self.imageLabel.alpha = 1.0
            self.startTimeToClassLabelConstraint.constant = 25
            self.bottomConstraint.constant = 30
        })
        
        self.view.layoutIfNeeded()
    }
    
   
    
}

extension ClassInfoVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func createDatePicker(){
          
           toolbar.sizeToFit()
           var buttons = [UIBarButtonItem]()
           
           let doneButton = UIBarButtonItem(title: "완료", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
           let cancelButton = UIBarButtonItem(title: "취소", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.cancelPressed))
           let titleBar = UIBarButtonItem(title: "시간 선택", style: UIBarButtonItem.Style.done, target: nil, action: nil)
           //let titleBar = ToolBarTitleItem(text: "시간 선택" , font: .systemFont(ofSize: 18), color: .black))
           let space1 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let space2 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           
           
           //toolbar button color 설정
           titleBar.isEnabled = false
           titleBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.dark], for: .disabled)
           cancelButton.tintColor = UIColor.softBlue
           doneButton.tintColor = UIColor.softBlue
               
           //toolbar에 버튼 넣기
           buttons = [cancelButton, space1, titleBar, space2, doneButton]
           toolbar.setItems(buttons, animated: true)
           
    
            startTextField.inputAccessoryView = toolbar
            startTextField.inputView = pickerView
        
        print("pickerView")
           
       }
    
    func createDatePicker2(){
       
        toolbar.sizeToFit()
        var buttons = [UIBarButtonItem]()
        
        let doneButton = UIBarButtonItem(title: "완료", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
        let cancelButton = UIBarButtonItem(title: "취소", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.cancelPressed))
        let titleBar = UIBarButtonItem(title: "시간 선택", style: UIBarButtonItem.Style.done, target: nil, action: nil)
        //let titleBar = ToolBarTitleItem(text: "시간 선택" , font: .systemFont(ofSize: 18), color: .black))
        let space1 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let space2 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        //toolbar button color 설정
        titleBar.isEnabled = false
        titleBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.dark], for: .disabled)
        cancelButton.tintColor = UIColor.softBlue
        doneButton.tintColor = UIColor.softBlue
            
        //toolbar에 버튼 넣기
        buttons = [cancelButton, space1, titleBar, space2, doneButton]
        toolbar.setItems(buttons, animated: true)
        
     endTextField.inputAccessoryView = toolbar
     endTextField.inputView = pickerView2
     
     print("pickerView2")
        
    }
    
    //toolbar actions
    @objc func donePressed(){
        
        //classTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        
    }
    @objc func cancelPressed(){
        self.view.endEditing(true)
        
        //print("cccccccccc")
        //toolbar.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return weekdays.count
        case 1:
            return startHours.count
        case 2:
            return startMins.count
        case 3:
            return endHours.count

        default:
            return 1
        }
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           
            
            switch component {
            case 0:
                return weekdays[row]
            case 1:
                return startHours[row]
            case 2:
                return startMins[row]
            case 3:
                return endHours[row]

            default:
                return ""
            }

        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
        if pickerView == self.pickerView {
            var startrow: Int = 0
                       
                       days = weekdays[pickerView.selectedRow(inComponent: 0)]
                       
                       if startHours[pickerView.selectedRow(inComponent: 1)] != "00" {
                           startH = startHours[pickerView.selectedRow(inComponent: 1)]
                           startrow = row
                           pickerView.selectRow(startrow, inComponent: 3, animated: true)
                           endH = endHours[pickerView.selectedRow(inComponent: 3)]
                       }
                       
                       
                       startM = startMins[pickerView.selectedRow(inComponent: 2)]
                       endH = endHours[pickerView.selectedRow(inComponent: 3)]
                   
                       
                       if days == "" {
                           days = weekdays[0]
                       } else if startH == "" {
                           startH = startHours[0]
                       } else if startM == "" {
                           startM = startMins[0]
                       } else if endH == "" {
                           endH = endHours[0]
            //           } else if endM == "" {
            //               endM = endMins[0]
                       }
                       
                       startTextField.text = days + " " + startH + "일" + " " + startM + ":" + endH
            
        } else {
            var startrow: Int = 0
                       
                       days = weekdays[pickerView2.selectedRow(inComponent: 0)]
                       
                       if startHours[pickerView2.selectedRow(inComponent: 1)] != "00" {
                           startH = startHours[pickerView2.selectedRow(inComponent: 1)]
                           startrow = row
                           pickerView2.selectRow(startrow, inComponent: 3, animated: true)
                           endH = endHours[pickerView2.selectedRow(inComponent: 3)]
                       }
                       
                       
                       startM = startMins[pickerView2.selectedRow(inComponent: 2)]
                       endH = endHours[pickerView2.selectedRow(inComponent: 3)]
                   
                       
                       if days == "" {
                           days = weekdays[0]
                       } else if startH == "" {
                           startH = startHours[0]
                       } else if startM == "" {
                           startM = startMins[0]
                       } else if endH == "" {
                           endH = endHours[0]
            
                       }
                       
                       endTextField.text = days + " " + startH + "일" + " " + startM + ":" + endH
        }
           
       }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
         switch component {
           case 0:
               return 70
           case 1:
               return 50
           case 2:
               return 50
           case 3:
               return 50
           default:
               return 1
        }
    }
    
}

    
