//
//  NotesModifyVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/06.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class NotesModifyVC: UIViewController {

    
    @IBOutlet weak var lessonTextField: UITextField!
    @IBOutlet weak var homeworkTextField: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var inprogressButton: UIButton!
    @IBOutlet weak var incompleteButton: UIButton!
    @IBOutlet weak var classColor: UIImageView!
    
    @IBOutlet weak var lesson: UITextField!
    @IBOutlet weak var homework: UITextField!
    
    
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
        // Do any additional setup after loading the view.
    }
    
    func setTextfield(){
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
        } else {
            completeButton.setImage(UIImage(named: "classLogModificationBtnCircleUnpick"), for: .normal)
        }
        
    }
    
    @objc func touchToInprogress(){
        if self.homeworkResult != "Inprogress"{
            self.homeworkResult = "Inprogress"
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTrianglePick"), for: .normal)
        } else {
            inprogressButton.setImage(UIImage(named: "classLogModificationBtnTriangleUnpick"), for: .normal)
        }
        
    }
    
    @objc func touchToIncomplete(){
        if self.homeworkResult != "Incomplete" {
            self.homeworkResult = "Incomplete"
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXPick"), for: .normal)
        } else {
            incompleteButton.setImage(UIImage(named: "classLogModificationBtnXUnpick"), for: .normal)
        }
        
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