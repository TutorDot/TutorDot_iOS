//
//  AlertVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {

    @IBOutlet weak var noticeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        noticeTableView.register(UINib(nibName:"AlertTableViewCell", bundle: nil), forCellReuseIdentifier: "AlertTableViewCell")

        
    }
    
    func setUpTableView() {
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        noticeTableView.separatorStyle = .none
        noticeTableView.register(AlertTableHeaderViewCell.self,
                                 forHeaderFooterViewReuseIdentifier: AlertTableHeaderViewCell.identifier)
    }
    

}

extension AlertVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
        cell.layer.cornerRadius = 8
//        cell.layer.borderColor = UIColor.clear.cgColor
//        cell.layer.borderWidth = 3
        cell.backgroundColor = UIColor.paleGrey
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell: AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
//        cell.backgroundColor = UIColor.paleGrey
//    }
    
    

    
    // Header 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
        AlertTableHeaderViewCell.identifier) as! AlertTableHeaderViewCell
       //view.title.text = sections[section]
        view.title.text = "5월 29일"
        view.title.font.withSize(10)
       view.image.image = UIImage(named: "noticeImgLine")
        view.contentView.backgroundColor = UIColor.clear
        view.tintColor = .clear

       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
}
