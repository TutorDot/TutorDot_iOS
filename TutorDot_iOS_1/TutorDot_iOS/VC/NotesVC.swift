//
//  NotesVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown

class NotesVC: UIViewController {

    
    @IBOutlet weak var listToggleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var dropDown:DropDown?
    
    private var NotesInfos: [NotesInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDropDown()
        setNotesInfos()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func listDropDown(){
        dropDown = DropDown()
        dropDown?.anchorView = listToggleButton
        self.dropDown?.width = 240
        DropDown.appearance().setupCornerRadius(7)
       
        // Top of drop down will be below the anchorView.
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "신연상학생 수학 수업", "신연하학생 영어 수업"]
        listToggleButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.listToggleButton.setTitle(item, for: .normal)
            
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
   
    func setNotesInfos(){
        //dummy data
        let data1 = NotesInfo(classLog: .yellow, currentClass: "4회차 12시간/16시간", lesson: "수학의정석", homework: "수학의정석")
        let data2 = NotesInfo(classLog: .green, currentClass: "4회차 14시간/16시간", lesson: "수학의정석", homework: "수학의정석")
        let data3 = NotesInfo(classLog: .red, currentClass: "4회차 12시간/16시간", lesson: "수학의정석", homework: "수학의정석")
        let data4 = NotesInfo(classLog: .blue, currentClass: "4회차 12시간/16시간", lesson: "수학의정석", homework: "수학의정석")
        let data5 = NotesInfo(classLog: .purple, currentClass: "4회차 12시간/16시간", lesson: "수학의정석", homework: "수학의정석")
        
        NotesInfos = [data1, data2, data3, data4, data5]
    }

}

extension NotesVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum: Int = 0
        
        switch section {
        case 0: //progress bar
            rowNum = 1
        case 1: //journal month cell
            rowNum = 1
        case 2: //journal data cell
            rowNum = NotesInfos.count
        default:
            break
        }

        return rowNum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let notesCell = tableView.dequeueReusableCell(withIdentifier: ClassProgressCell.identifier, for: indexPath) as? ClassProgressCell else { return UITableViewCell()}
            
            notesCell.setProgress()
            return notesCell
            
        case 1:
            guard let notesCell = tableView.dequeueReusableCell(withIdentifier: MonthJournalCell.identifier, for: indexPath) as? MonthJournalCell else { return UITableViewCell()}
            
            notesCell.setMonthLabel(5) //일단 5월로 지정
            
            return notesCell
            
        case 2:
            guard let notesCell = tableView.dequeueReusableCell(withIdentifier: JournalDataCell.identifier, for: indexPath) as? JournalDataCell else { return UITableViewCell()}
            
            notesCell.setClassJournalInfo(classLog: NotesInfos[indexPath.row].classLog.getImageName(), currentClass: NotesInfos[indexPath.row].currentClass, lesson: NotesInfos[indexPath.row].lesson, homework: NotesInfos[indexPath.row].homework) //일단 5월로 지정
            
            return notesCell
            
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    
}

extension NotesVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var height: CGFloat = 80 //default 80으로 셋팅
//        let section: Int = numberOfSections(in: tableView)
//        switch section {
//        case 0: height = 117
//        case 1 : height = 67
//        case 2 : height = 169
//        default : break
//        }
//        return height
        return UITableView.automaticDimension
    }
}
