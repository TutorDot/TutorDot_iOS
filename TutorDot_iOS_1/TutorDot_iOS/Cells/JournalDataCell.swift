//
//  JournalDataCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/05.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class JournalDataCell: UITableViewCell {

    static let identifier: String = "JournalDataCell"

    @IBOutlet weak var classColorImage: UIImageView!
    @IBOutlet weak var currentClassTitleLabel: UILabel!
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var homeworkLabel: UILabel!
    
    @IBOutlet weak var hwIncompleteButton: UIButton!
    @IBOutlet weak var hwInprogressButton: UIButton!
    @IBOutlet weak var hwCompleteButton: UIButton!
    
    var iscompleteBtn: Bool = false
    var isIncompleteBtn: Bool = false
    var isInprogress: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setClassJournalInfo(classLog : String, currentClass: String, lesson:String, homework:String){
        classColorImage.image = UIImage(named: classLog)
        currentClassTitleLabel.text = currentClass
        lessonLabel.text = "진도 :" + lesson
        homeworkLabel.text = "숙제 : " + homework
    }
    
    func setcompleteBtn(_ status: Bool){
        if status {
            hwCompleteButton.setImage(UIImage(named: "classLogModificationBtnCirclePick"), for: .normal)
            iscompleteBtn = true
        } else {
            hwCompleteButton.setImage(UIImage(named: "classLogModificationBtnCircleUnpick"), for: .normal)
            iscompleteBtn = false
        }
    }
    
    func setIncompleteBtn(_ status: Bool){
        if status {
            hwIncompleteButton.setImage(UIImage(named: "classLogModificationBtnXPick"), for: .normal)
            isIncompleteBtn = true
        } else {
            hwIncompleteButton.setImage(UIImage(named: "classLogModificationBtnXUnpick"), for: .normal)
            isIncompleteBtn = false
        }
    }

    func setInprogressBtn(_ status: Bool){
        if status {
           hwInprogressButton.setImage(UIImage(named: "classLogModificationBtnTrianglePick"), for: .normal)
           isInprogress = true
        } else {
           hwInprogressButton.setImage(UIImage(named: "classLogModificationBtnTriangleUnpick"), for: .normal)
           isInprogress = false
        }
    }
    
    @IBAction func pressCompleteBtn(_ sender: Any) {
        print("complete")
        if !iscompleteBtn {
            setcompleteBtn(true)
            setInprogressBtn(false)
            setIncompleteBtn(false)
        } else {
            setcompleteBtn(false)
        }
    }
    
    @IBAction func pressInprogressBtn(_ sender: Any) {
        print("Inprogress")
        if !isInprogress {
            setcompleteBtn(false)
            setInprogressBtn(true)
            setIncompleteBtn(false)
        } else {
            setInprogressBtn(false)
        }
    }
    
    @IBAction func pressIncompleteBtn(_ sender: Any) {
        print("Incomplete")
        if !isIncompleteBtn {
            setcompleteBtn(false)
            setInprogressBtn(false)
            setIncompleteBtn(true)
        } else {
            setIncompleteBtn(false)
        }
    }
    
    
}
