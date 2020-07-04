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
    
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    var tutorCollectionViewCellInstance: TutorCollectionViewCell?
    var classNameHeader: String?
    var classNameBody: String = ""
    var classImage: String = ""
//    @IBOutlet weak var startTimeLabel: UILabel!
//    @IBOutlet weak var endTimeLabel: UILabel!
//    @IBOutlet weak var classNameLabel: UILabel!
//    @IBOutlet weak var classHourLabel: UILabel!
//    @IBOutlet weak var locationLabel: UILabel!
//    @IBOutlet weak var colorImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        initView()
    }
    
    func setView() {
        editButton.setTitleColor(UIColor.softBlue, for: .normal)
    }

    private func initView() {
        guard let className = self.classNameHeader else {return}
        //profileImageView.image = UIImage(named: imageProfile)
        headerLabel.text = className
        classLabel.text = classNameBody
    }
    
    // 편집 버튼 클릭시
    @IBAction func editButtonSelected(_ sender: Any) {
        startTextField.isUserInteractionEnabled = true
        headerLabel.text = "일정 수정"
        startTextField.backgroundColor = UIColor.paleGrey
        endTextField.backgroundColor = UIColor.paleGrey
        locationTextField.backgroundColor = UIColor.paleGrey

    }
    
    
}
    

