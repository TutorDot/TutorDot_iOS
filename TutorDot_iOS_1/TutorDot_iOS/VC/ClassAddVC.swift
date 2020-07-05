//
//  ClassAddVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 04/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import DropDown

class ClassAddVC: UIViewController {

    static let identifier: String = "ClassAddVC"
    
    // DropDown Setup
    @IBOutlet weak var classInfoButton: UIButton!
    @IBOutlet weak var classInfoImage:
    UIImageView!
    @IBOutlet weak var dropDownButton: UIButton!
    var dropDown:DropDown?
    
     // PickerView Setup
    //@IBOutlet weak var startTableVIew: UITableView!
    private var items: [PickerViewCell] = []

    @IBOutlet weak var testPickerView: UIDatePicker!
    
    func setTimeZone() {
        testPickerView.timeZone = .current
    }
    

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setListDropDown()
        showPicker(false)
        setTimeZone()
        setUpLabel()
    }
    @IBOutlet weak var pickHeight: NSLayoutConstraint!
    //@IBOutlet weak var pickLabel: UILabel!
    @IBOutlet weak var pickLabel: UITextField!
    
    
    @IBAction func pickerButton(_ sender: Any) {
        showPicker(true)
        pickLabel.text = "\(testPickerView.date)"
        
    }
    

    func showPicker(_ show:Bool) {
        self.pickHeight?.constant = show ? 200 : 0
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }

    }
    
    func setUpLabel() {
        pickLabel.backgroundColor = UIColor.paleGrey
    }
    

    func setListDropDown(){
        classInfoButton.setTitle("전체", for: .normal)
        dropDown = DropDown()
        dropDown?.anchorView = classInfoButton
        self.dropDown?.width = view.frame.width - 20
        DropDown.appearance().setupCornerRadius(7)
        dropDown?.backgroundColor = UIColor.white
        
        // Top of drop down will be below the anchorView.
        // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
        //dropDown?.
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "신연상학생 수학 수업", "신연하학생 영어 수업"]
        dropDownButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.classInfoButton.setTitle(item, for: .normal)
            
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
    
//    private func setPickerViewList() {
//        let item1 = PickerViewCell(startDateLabel: "")
//        let item2 = PickerViewCell(startDateLabel: "")
//
//        itxems = [item1, item2]
//    }

}

//extension ClassAddVC: UITableViewDelegate, UITableViewDataSource {
//    //section 수
//    func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
//
//    //cell 수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if items[section].open == true {
//            return 1 + 1
//        }else{
//            return 1
//        }
//    }
//
//    //cell 크기
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 40
//        }else {
//            return 200
//        }
//    }
//
//    //cell구현
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.row == 0 {
//            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
//            return cell
//        }else {
//            //클릭시 펼쳐질 셀
//            let cell: DatePickerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DatePickerTableViewCell", for: indexPath) as! DatePickerTableViewCell
//            return cell
//        }
//    }
//    
//    //cell 확장효과
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? HeaderTableViewCell else {return}
//        guard let cell2 = tableView.cellForRow(at: indexPath) as? DatePickerTableViewCell else {return}
//        guard let index = tableView.indexPath(for: cell) else { return }
//
//        heightConstraint.constant = 170
//        if index.row == indexPath.row {
//            if index.row == 0 {
//                if items[indexPath.section].open == true {
//                    items[indexPath.section].open = false
//                    cell.startDateLabel.text = "\(cell2.startPickerView.date)"
//                    let section = IndexSet.init(integer: indexPath.section)
//                    tableView.reloadSections(section, with: .fade)
//                    heightConstraint.constant = 38
//                    UIView.animate(withDuration: 0.5) {
//                        self.view.layoutIfNeeded()
//                    }
//
//                } else {
//                    items[indexPath.section].open = true
//                    cell.startDateLabel.text = "\(cell2.startPickerView.date)"
//                    let section = IndexSet.init(integer: indexPath.section)
//                    tableView.reloadSections(section, with: .fade)
//                    UIView.animate(withDuration: 0.5) {
//                        self.view.layoutIfNeeded()
//                    }
//                }
//            }
//        }
//
//
//    }
//
//}
//
////extension ClassAddVC: UITableViewDataSource, UITableViewDelegate {
////
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 1
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 2
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        if indexPath.row == 0 {
////            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
////            return cell
////        }else {
////            //클릭시 펼쳐질 셀
////            let cell: DatePickerTableViewCell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.identifier, for: indexPath) as! DatePickerTableViewCell
////            return cell
////        }
////    }
////
////    // PickerView Expand
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        if indexPath.row == 0 {
////            return 40
////        }else {
////            return 250
////        }
////
////    }
////
////
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        guard let cell = tableView.cellForRow(at: indexPath) as? DatePickerTableViewCell else {return}
////        //guard let index = tableView.indexPath(for: cell) else { return }
////
////        //heightConstraint.constant = 170
////
////        if indexPath.row == 0 {
////
////            cell.startPickerView.isHidden = cell.startPickerView.isHidden
////
////            UIView.animate(withDuration: 0.3, animations: { () -> Void in
////                self.startTableVIew.beginUpdates()
////                // apple bug fix - some TV lines hide after animation
////                self.startTableVIew.deselectRow(at: indexPath, animated: true)
////                self.startTableVIew.endUpdates()
////            })
////        }
////
////
////
//
////
////
////
////}
////}
