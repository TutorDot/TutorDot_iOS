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
    }
    

}

extension AlertVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 3
        return cell
    }
    
    // Header 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "5월 29일"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.clear
//        return headerView
//    }
    
    
    
}
