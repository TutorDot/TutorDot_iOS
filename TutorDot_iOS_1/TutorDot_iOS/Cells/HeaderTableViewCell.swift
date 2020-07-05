//
//  HeaderTableViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 05/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    static let identifier: String = "HeaderTableViewCell"
    @IBOutlet weak var startDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
