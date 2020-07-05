//
//  ClassProgressCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/05.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ClassProgressCell: UITableViewCell {
    
    static let identifier: String = "ClassProgressCell"
    
    @IBOutlet weak var classProgressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var currentClassLabel: UILabel!
    @IBOutlet weak var totalClassLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setProgress(){
        classProgressBar.layer.cornerRadius = 9
        classProgressBar.clipsToBounds = true
    }
    
    func setProgressInfo(progressRate: String, currentClass: String, totalClass:String){
        progressLabel.text = progressRate
        currentClassLabel.text = currentClass
        totalClassLabel.text = totalClass
    }

}
