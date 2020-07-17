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

    @IBOutlet weak var headerViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classHeaderLabel: UILabel!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var classImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        headerViewHeightConstraints.constant = view.frame.height * (94/812)
        
    }

    
    func setUpView() {
        startTextField.addLeftPadding()
        endTextField.addLeftPadding()
        locationTextField.addLeftPadding()
        startTextField.textColor = UIColor.brownishGrey
        endTextField.textColor = UIColor.brownishGrey
        locationTextField.textColor = UIColor.brownishGrey

    }
    
    
    @IBAction func editButton(_ sender: Any) {
        // 편집 확인하는 actionsheet 열기
        let alert: UIAlertController
        
        alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        var cancelAction: UIAlertAction
        var delete: UIAlertAction
        var editAll: UIAlertAction
        
        cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
        })
        delete = UIAlertAction(title: "삭제하기", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction) in
            //self.deleteClass()
            
        })
        
        editAll = UIAlertAction(title: "편집하기", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
            self.editAllClick()
        })
        
        alert.addAction(cancelAction)
        alert.addAction(editAll)
        alert.addAction(delete)
        self.present(alert,animated: true){
            
        }

        
        
    
}
    
    func editAllClick() {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: ClassInfoVC.identifier) as? ClassInfoVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: false, completion: nil)
        
        if let className = self.classLabel.text {
            print(className)
            receiveViewController.classLabel.text = className
            
            //ClassInfoVC에 해당 내용들 넘겨주기
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
    }
    
    func deleteClass() {
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "MainTab", bundle: nil)
        guard let receiveViewController = storyboard.instantiateViewController(identifier: TabbarVC.identifier) as? TabbarVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: false, completion: nil)
        
    }
    
    


}
