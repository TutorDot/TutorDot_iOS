//
//  ClassEditVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 07/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import UIKit

class ClassEditVC: UIViewController {
    static let identifier:String = "ClassEditVC"

    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classHeaderLabel: UILabel!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var classImage: UIImageView!
    
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
    

    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
