//
//  JournalDateHeaderCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class JournalDateHeaderCell: UITableViewCell {

    static let identifier: String = "JournalDateHeaderCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
