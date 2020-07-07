//
//  MyPageVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension MyPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 2
        case 1 :
            return 2
        case 2 :
            return 3
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageNoticeSettingCell.identifier, for: indexPath) as? MypageNoticeSettingCell else { return UITableViewCell()}
            
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageInfoCell.identifier, for: indexPath) as? MypageInfoCell else { return UITableViewCell()}
            
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageServiceCell.identifier, for: indexPath) as? MypageServiceCell else { return UITableViewCell()}
            
            return cell
            
        default :
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 10)
        view.backgroundColor = UIColor(red: 245 / 255, green: 246 / 255, blue: 250 / 255, alpha: 1.0)
        return view
    }
}
