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
    

    @IBAction func pressCompleteBtn(_ sender: Any) {
        
    }
    
    @IBAction func pressInprogressBtn(_ sender: Any) {
        
    }
    
    @IBAction func pressIncompleteBtn(_ sender: Any) {
        
    }
}
