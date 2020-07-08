//
//  AlertTableViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 06/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class AlertTableViewCell: UITableViewCell {
    static let identifier:String = "AlertTableViewCell"
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var noticeTitle: UILabel!
    @IBOutlet weak var noticeDetail: UILabel!
    @IBOutlet weak var newNoticeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setView()
        //self.tableView.register(UITableViewCell.self, forCellWithReuseIdentifier: "AlertTableViewCell")

    }
    
    
    
    func setView() {
        cellView.layer.cornerRadius = cellView.frame.width/24
        cellView.backgroundColor = .white
        noticeTitle.text = "수업일지가 추가되었습니다"
        noticeDetail.text = "류세화 선생님의 수학 수업 일지가 업데이트 되었습니다."
        iconImage.image = UIImage(named: "noticeImgClasslogYellow")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, indexPath: IndexPath) -> AlertTableViewCell {
        let AlertCollectionViewCellIdentifier = "AlertTableViewCell"
        tableView.register(UINib(nibName: "AlertTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "AlertTableViewCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: AlertCollectionViewCellIdentifier, for: indexPath) as! AlertTableViewCell
        return cell
    }
}
