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
        setSettingView()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private var alert: [MypageInfo] = []
    private var info: [MypageInfo] = []
    private var service: [MypageInfo] = []

    func setSettingView(){
        let alert1 = MypageInfo(title: "수업료 알림")
        let alert2 = MypageInfo(title: "수업 시작 전 알림")
        let info1 = MypageInfo(title: "버전정보")
        let info2 = MypageInfo(title: "개발자정보")
        let service1 = MypageInfo(title: "비밀번호 변경")
        let service2 = MypageInfo(title: "로그아웃")
        let service3 = MypageInfo(title: "서비스 탈퇴")
        
        alert = [alert1, alert2]
        info = [info1, info2]
        service = [service1, service2, service3]
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
            print(alert.count)
            return alert.count
        case 1 :
            print(info.count)
            return info.count
        case 2 :
            print(service.count)
            return service.count
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageNoticeSettingCell.identifier, for: indexPath) as? MypageNoticeSettingCell else { return UITableViewCell()}
            
            cell.setTitleInfo(alert[indexPath.row].title)
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageInfoCell.identifier, for: indexPath) as? MypageInfoCell else { return UITableViewCell()}
            cell.setTitleInfo(info[indexPath.row].title)
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageServiceCell.identifier, for: indexPath) as? MypageServiceCell else { return UITableViewCell()}
            cell.setTitleInfo(service[indexPath.row].title)
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
