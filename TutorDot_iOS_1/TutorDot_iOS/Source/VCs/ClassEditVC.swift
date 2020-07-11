//
//  ClassEditVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 07/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import UIKit

class ClassEditVC: UIViewController, UIGestureRecognizerDelegate {
    static let identifier:String = "ClassEditVC"

    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classHeaderLabel: UILabel!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var classImage: UIImageView!
    @IBOutlet weak var deleteClassButton: UIButton!
    @IBOutlet weak var deleteClassLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    
    func setUpView() {
        startTextField.addLeftPadding()
        endTextField.addLeftPadding()
        locationTextField.addLeftPadding()
        startTextField.textColor = UIColor.brownishGrey
        endTextField.textColor = UIColor.brownishGrey
        locationTextField.textColor = UIColor.brownishGrey
        deleteClassButton.backgroundColor = UIColor.paleGrey
        deleteClassLabel.textColor = UIColor.grapefruit
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: ClassInfoVC.identifier) as? ClassInfoVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: false, completion: nil)
        
        if let className = self.classLabel.text {
            print(className)
            receiveViewController.classLabel.text = className
            //receiveViewController.classHeaderLabel.text = className
            
        }
        // ClassInfoVC에 해당 내용들 넘겨주기
        // 상세 페이지 과외 시작, 끝, 장소 레이블 업데이트
        if let startHour = self.startTextField.text {
            receiveViewController.startTextField.text = startHour
        }
        
        if let endHour = self.endTextField.text {
            receiveViewController.endTextField.text = endHour
        }
        
        if let location = self.locationTextField.text {
            receiveViewController.locationTextField.text = location
        }
        
        if let image = self.classImage.image {
            receiveViewController.imageLabel.image = image
        }
        
        
    
    }
    

    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "MainTab", bundle: nil)
        guard let receiveViewController = storyboard.instantiateViewController(identifier: TabbarVC.identifier) as? TabbarVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: false, completion: nil)
        
    }
    
    
    @IBAction func deleteButtonSelected(_ sender: Any) {
        // 삭제 확인하는 actionsheet 열기
        let alert: UIAlertController
        
        alert = UIAlertController(title: classLabel.text, message: "일정을 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.actionSheet)
        
        var cancelAction: UIAlertAction
        var editFriend: UIAlertAction
        
        cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
        })
        editFriend = UIAlertAction(title: "삭제하기", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction) in
            
        })
        
        //editAll = UIAlertAction(title: "전체 설정", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
        //})
        
        alert.addAction(cancelAction)
        alert.addAction(editFriend)
        //alert.addAction(editAll)
        self.present(alert,animated: true){
            
        }
    }
    
    


}
