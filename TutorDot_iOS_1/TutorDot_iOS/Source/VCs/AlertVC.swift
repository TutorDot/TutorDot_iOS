//
//  AlertVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown


class AlertVC: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var noticeTableView: UITableView!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dropDownLabelButton: UIButton!
    @IBOutlet weak var dropDownButton: UIButton!
    var dropDown : DropDown?
    var noticeList: [AlertInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setListDropDown()
        setUpHeaderView()
        setList()
        
        
    }
    
    func setUpHeaderView() {
        self.headerView.sendSubviewToBack(anchorView)
        anchorView.frame.size.width = headerView.frame.size.width/1.5
        headerViewHeightConstraint.constant = self.view.frame.height * 94/812
        
    }
    
    func setListDropDown(){
        dropDown = DropDown()
        dropDown?.anchorView = anchorView
        self.dropDown?.width = 240
        DropDown.appearance().setupCornerRadius(7)
        dropDown?.backgroundColor = UIColor.white
        dropDown?.selectionBackgroundColor = UIColor.paleGrey
        dropDown?.separatorColor = UIColor.paleGrey
        
       
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        //dropDown?.
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "류세화학생 수학 수업", "최인정학생 영어 수업"]
        dropDownButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownLabelButton.setTitle(item, for: .normal)
            
        }

        // 드롭박스 내 text 가운데 정렬
        dropDown?.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            // Setup your custom UI components
            cell.optionLabel.textAlignment = .center
        }
    }
    
    @objc func dropDownToggleButton(){
        dropDown?.show()
    }
    
    func setUpTableView() {
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        noticeTableView.separatorStyle = .none
        noticeTableView.register(UINib(nibName:"AlertTableViewCell", bundle: nil), forCellReuseIdentifier: "AlertTableViewCell")
        noticeTableView.register(AlertTableHeaderViewCell.self,
                                 forHeaderFooterViewReuseIdentifier: AlertTableHeaderViewCell.identifier)
    }
    
    func setList() {
        let notice1 = AlertInfo(icon: AlertInfo.IconLog.classPencil, noticeInfo: "수업일지가 추가되었습니다", detail: "신연상 선생님의 수학 수업 일지가 업데이트 되었습니다.", newNotice: true)
        let notice2 = AlertInfo(icon: AlertInfo.IconLog.classInfo, noticeInfo: "내일 수업이 있습니다", detail: "최인정 선생님의 수학 수업이 내일 예정되어 있습니다.", newNotice: true)
        let notice3 = AlertInfo(icon: AlertInfo.IconLog.classMoney, noticeInfo: "수업료 입금을 확인해주세요", detail: "류세화 선생님의 물리 수업 회차가 끝났습니다.", newNotice: true)
        let notice4 = AlertInfo(icon: AlertInfo.IconLog.classInfo, noticeInfo: "수업 정보가 변경되었습니다다", detail: "신연상 선생님의 영어 수업 정보가 변경되었습니다.", newNotice: false)
        let notice5 = AlertInfo(icon: AlertInfo.IconLog.classPencil, noticeInfo: "수업일지가 추가되었습니다", detail: "신연상 선생님의 수학 수업 일지가 업데이트 되었습니다.", newNotice: false)
        let notice6 = AlertInfo(icon: AlertInfo.IconLog.classInfo, noticeInfo: "내일 수업이 있습니다", detail: "최인정 선생님의 수학 수업이 내일 예정되어 있습니다.", newNotice: false)
        let notice7 = AlertInfo(icon: AlertInfo.IconLog.classMoney, noticeInfo: "수업료 입금을 확인해주세요", detail: "류세화 선생님의 물리 수업 회차가 끝났습니다.", newNotice: false)
        let notice8 = AlertInfo(icon: AlertInfo.IconLog.classInfo, noticeInfo: "수업 정보가 변경되었습니다다", detail: "신연상 선생님의 영어 수업 정보가 변경되었습니다.", newNotice: false)
        
        noticeList = [notice1, notice2, notice3, notice4, notice5, notice6, notice7, notice8]
    
    }
    

}



extension AlertVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let numOfSections: Int = 3
        if noticeTableView.numberOfSections > 0
        {
            //tableView.separatorStyle = .singleLine
            //numOfSections = 1
            noticeTableView.backgroundView = nil
        }
        else
        { // 알림이 없는 경우
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            let subLagel: UILabel  = UILabel(frame: CGRect(x: 50, y: 50, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = "알림이 없습니다"
            //noDataLabel.
            noDataLabel.font.withSize(16)
            noDataLabel.textColor     = UIColor.brownishGrey
            noDataLabel.textAlignment = .center
            subLagel.text = "새로운 소식을 기다려주세요"
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return numOfSections
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
        cell.set(noticeList[indexPath.row])
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.clear
        return cell
    }
    

    // Header 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
        AlertTableHeaderViewCell.identifier) as! AlertTableHeaderViewCell
       // 날짜 데이터 받아오기
        view.title.text = "5월 29일"
        view.title.font.withSize(10)
       view.image.image = UIImage(named: "noticeImgLine")
        view.contentView.backgroundColor = UIColor.clear
        view.tintColor = .clear

       return view
    }
    
    // 스와이프 해서 삭제하기
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if indexPath.section == 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (action, view, success ) in
                self.noticeList.remove(at: indexPath.row)
                self.noticeTableView.reloadData()
                print(self.noticeList.count)

            }
            let config = UISwipeActionsConfiguration(actions: [deleteAction])
            config.performsFirstActionWithFullSwipe = false
            return config
        }
        else {
            return UISwipeActionsConfiguration()
        }
    }
    
    
}
