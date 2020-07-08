//
//  MonthJournalCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/05.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MonthJournalCell: UITableViewCell {

    static let identifier: String = "MonthJournalCell"
//    var month: Int = 0
//
//    @IBOutlet weak var monthLable: UILabel!
//
//
//    @IBAction func previousButton(_ sender: Any) {
//        //추후 분기문으로 바운더리 지정
//        month += 1
//        setMonthLabel(month)
//    }
//
//    @IBAction func nextButton(_ sender: Any) {
//        //추후 분기문으로 바운더리 지정
//        month -= 1
//        setMonthLabel(month)
//    }
//
//    func setMonthLabel(_ monthInput: Int){
//        var monthStr: String
//        monthStr = String(monthInput)
//        month = monthInput
//
//        monthLable.text = monthStr + "월 수업 일지"
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}
