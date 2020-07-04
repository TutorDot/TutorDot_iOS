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
    var dropDown:DropDown?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDropDown()
        
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
   

}
