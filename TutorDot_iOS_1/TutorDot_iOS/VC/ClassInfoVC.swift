//
//  ClassInfoVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 03/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown

class ClassInfoVC: UIViewController {

    static let identifier: String = "ClassInfoVC"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addCancelButton: UIButton!
    
    // Dropdown
    @IBOutlet weak var classEditButton: UIButton!
    var dropDown:DropDown?


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
    
    var tutorCollectionViewCellInstance: TutorCollectionViewCell?
    var classNameHeader: String?
    var classNameBody: String = ""
    var classImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        initView()
        setListDropDown()
        showPicker(false)
        showPicker2(false)
    }
    
    func setView() {
        editButton.setTitleColor(UIColor.white, for: .normal)
        editButton.setTitle("편집", for: .normal)
    }

    private func initView() {
        guard let className = self.classNameHeader else {return}
        //profileImageView.image = UIImage(named: imageProfile)
        headerLabel.text = className
        classLabel.text = classNameBody
        editButton.setTitle("편집", for: .normal)
    }
    
    // 편집 버튼 클릭시
    @IBAction func editButtonSelected(_ sender: Any) {
        headerLabel.text = "일정 수정"
        startTextField.backgroundColor = UIColor.paleGrey
        endTextField.backgroundColor = UIColor.paleGrey
        locationTextField.backgroundColor = UIColor.paleGrey
        addCancelButton.setImage(UIImage(named: "scheduleModificationBtnCancel"), for: .normal)
        classEditButton.setImage(UIImage(named: "scheduleModificationSubjectsection"), for: .normal)
        editButton.setTitle("", for: .normal)
        editButton.setImage(UIImage(named: "scheduleModificationBtnSave"), for: .normal)
        pickerButton1.setTitle("수정하기", for: .normal)
        pickerButton2.setTitle("수정하기", for: .normal)
        locationTextField.isUserInteractionEnabled = true

    }
    
    // Dropdown
    func setListDropDown(){
        //classInfoButton.setTitle("전체", for: .normal)
        dropDown = DropDown()
        dropDown?.anchorView = classLabel
        self.dropDown?.width = view.frame.width - 20
        DropDown.appearance().setupCornerRadius(7)
        dropDown?.backgroundColor = UIColor.white
        
        // Top of drop down will be below the anchorView.
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        //dropDown?.
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "류세화학생 수학 수업", "최인정학생 영어 수업"]
        classEditButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.classLabel.text = item
            
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
            pickerButton1.setTitle("수정하기", for: .normal)
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
            pickerButton2.setTitle("수정하기", for: .normal)
        }
    }
    
    @IBAction func editCancelButton(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: CalendarVC.identifier) else { return }
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
    

