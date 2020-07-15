//
//  NotesModifyVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/06.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class NotesModifyVC: UIViewController {

    static let identifier: String = "NotesModifyVC"
    @IBOutlet weak var lessonTextField: UITextField!
    @IBOutlet weak var homeworkTextField: UITextField!
    @IBOutlet weak var headerHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var inprogressButton: UIButton!
    @IBOutlet weak var incompleteButton: UIButton!
    
    @IBOutlet weak var classColor: UIImageView!
    @IBOutlet weak var lesson: UITextField!
    @IBOutlet weak var homework: UITextField!
    var hwStatus: Bool = false
    
    @IBAction func onClickCompleteBtn(_ sender: Any) {
        touchToComplete()
    }
    
    @IBAction func onClickInprogressBtn(_ sender: Any) {
        touchToInprogress()
    }
    
    @IBAction func onClickIncompleteBtn(_ sender: Any) {
        touchToIncomplete()
    }
    
    var homeworkResult: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextfield()
        autoLayoutView()
        
    }
    func autoLayoutView(){
        headerHeightConstraints.constant = view.frame.height * 94/812
        
    }
    func setTextfield(){
        lesson.addLeftPadding()
        homework.addLeftPadding()
        lesson.placeholder = "해당 수업의 진도를 입력해주세요"
        homework.placeholder = "해당 수업의 숙제를 입력해주세요"
    }
    
    func setClassColor(){
        classColor.image = UIImage(named: "ColorImgYellow")
    }
    
    
    @objc func touchToComplete(){
        if self.homeworkResult != "Complete" {
            self.homeworkResult = "Complete"
            completeButton.setImage(UIImage(named: "classLogModificationBtnCirclePick"), for: .normal)
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTriangleUnpick"), for: .normal)
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXUnpick"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "classLogModificationBtnCircleUnpick"), for: .normal)
        }
        
    }
    
    @objc func touchToInprogress(){
        if self.homeworkResult != "Inprogress"{
            self.homeworkResult = "Inprogress"
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTrianglePick"), for: .normal)
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXUnpick"), for: .normal)
            completeButton.setImage(UIImage(named: "classLogModificationBtnCircleUnpick"), for: .normal)
        } else {
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTriangleUnpick"), for: .normal)
        }
        
    }
    
    @objc func touchToIncomplete(){
        if self.homeworkResult != "Incomplete" {
            self.homeworkResult = "Incomplete"
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXPick"), for: .normal)
            completeButton.setImage(UIImage(named: "classLogModificationBtnCircleUnpick"), for: .normal)
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTriangleUnpick"), for: .normal)
        } else {
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXUnpick"), for: .normal)
        }
        
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
