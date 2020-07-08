//
//  ClassInfoVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 03/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import UIKit

class ClassInfoVC: UIViewController {

    static let identifier: String = "ClassInfoVC"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addCancelButton: UIButton!
    
    // Dropdown
//    @IBOutlet weak var classEditButton: UIButton!
//    var dropDown:DropDown?

    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    // PickerView
    @IBOutlet weak var startPicker: UIDatePicker!
    @IBOutlet weak var startConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickerButton1: UIButton!
    
    @IBOutlet weak var endPicker: UIDatePicker!
    @IBOutlet weak var endConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickerButton2: UIButton!
    
    var isOpen = false
    var editClicked = false
    
    var tutorCollectionViewCellInstance: TutorCollectionViewCell?
    var classNameHeader: String?
    var classNameBody: String = ""
    var classImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        showPicker(false)
        showPicker2(false)
        print (classNameBody)
    }
    
    func setUpView() {
        //pickerButton1.setTitle("수정", for: .normal)
        classLabel.text = classNameBody
        startTextField.backgroundColor = UIColor.paleGrey
        endTextField.backgroundColor = UIColor.paleGrey
        locationTextField.backgroundColor = UIColor.paleGrey
        pickerButton1.tintColor = UIColor.softBlue
        pickerButton2.tintColor = UIColor.softBlue
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
        
    
    }
    
    // 취소 버튼 클릭 시 ClassEditVC로 그냥 돌아오기
    @IBAction func editCancelButton(_ sender: Any) {
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle:nil)
        guard let controller = calendarStoryboard.instantiateViewController(withIdentifier: ClassEditVC.identifier) as? ClassEditVC else { return }
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
        
        
        //        receiveViewController.modalPresentationStyle = .fullScreen
        //        self.present(receiveViewController, animated: true, completion: nil)
        
    }
    
    

    @IBAction func pickerButton(_ sender: Any) {
        expandPicker()
                startTextField.text = "\(startPicker.date)"
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day,.month,.hour,.minute], from: self.startPicker.date)
                
                // 서버 저장용 데이터
                let formatterForData = DateFormatter()
                formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
                
                // 레이블용 데이터
                let formatterForLabel = DateFormatter()
                formatterForLabel.dateFormat = "M월 d일 h:mm a"
                startTextField.text = formatterForLabel.string(from: startPicker.date)
            }
        
    
    
    func showPicker(_ show:Bool) {
        self.startConstraint?.constant = show ? 200 : 0
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    func expandPicker(){
        if isOpen == false {
            isOpen = true
            self.startConstraint?.constant = 180
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton1.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.startConstraint?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton1.setTitle("수정", for: .normal)
        }
    }
    
    @IBAction func pickerButton2(_ sender: Any) {
        expandPicker2()
            endTextField.text = "\(endPicker.date)"
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day,.month,.hour,.minute], from: self.endPicker.date)
            
            // 서버 저장용 데이터
            let formatterForData = DateFormatter()
            formatterForData.dateFormat = "MM/dd/yyyy/hh-mm"
            
            // 레이블용 데이터
            let formatterForLabel = DateFormatter()
            formatterForLabel.dateFormat = "M월 d일 h:mm a"
            endTextField.text = formatterForLabel.string(from: endPicker.date)
        }

    func showPicker2(_ show:Bool) {
        self.endConstraint?.constant = show ? 200 : 0
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    func expandPicker2(){
        if isOpen == false {
            isOpen = true
            self.endConstraint?.constant = 180
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton2.setTitle("완료", for: .normal)
        } else {
            isOpen = false
            self.endConstraint?.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            pickerButton2.setTitle("수정", for: .normal)
        }
    }
    
   
    
}
    
