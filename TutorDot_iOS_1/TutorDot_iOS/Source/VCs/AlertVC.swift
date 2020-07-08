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
    
    @IBOutlet weak var dropDownLabelButton: UIButton!
    @IBOutlet weak var dropDownButton: UIButton!
    var dropDown : DropDown?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setListDropDown()
        setUpHeaderView()
        
        
    }
    
    func setUpHeaderView() {
        self.headerView.sendSubviewToBack(anchorView)
        anchorView.frame.size.width = headerView.frame.size.width/1.5
    }
    
    func setListDropDown(){
        dropDown = DropDown()
        dropDown?.anchorView = anchorView
        self.dropDown?.width = 240
        DropDown.appearance().setupCornerRadius(7)
       
        // Top of drop down will be below the anchorView.
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
    

}

extension AlertVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlertTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlertTableViewCell.identifier, for: indexPath) as! AlertTableViewCell
        cell.layer.cornerRadius = 8
//        cell.layer.borderColor = UIColor.clear.cgColor
//        cell.layer.borderWidth = 3
        cell.backgroundColor = UIColor.paleGrey
        return cell
    }
    

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
