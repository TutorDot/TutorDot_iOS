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
    
    

    @IBOutlet weak var viewHeaderHeight: NSLayoutConstraint!
    @IBOutlet weak var ClassHeaderView: UIView! //class progress bar
   
    @IBOutlet weak var progressViewWrap: UIStackView!
    @IBOutlet weak var tableViewTopMargin: NSLayoutConstraint!
    
    @IBOutlet weak var listToggleButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dropboxbound: UIView!
    @IBOutlet weak var notesTitle: UIButton!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var currentClassLabel: UILabel!
    @IBOutlet weak var totalClassLabel: UILabel!
  
    func classHeaderHidden(_ ishide: Bool){
        progressViewWrap.subviews[0].isHidden = ishide
        if ishide { //true(안보일때)
            tableViewTopMargin.constant = 191-117
        } else { //false (보일때)
            tableViewTopMargin.constant = 191
        }
    }
    
    func setProgress(){
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 9
        progressView.subviews[1].clipsToBounds = true
        
        progressView.tintColor = UIColor.init(named: "Color")
        progressView.progressViewStyle = .default
        progressView.progress = 0.1 //0.2로 두고 테스트
    }
   
   func setProgressInfo(progressRate: String, currentClass: String, totalClass:String){
       progressLabel.text = progressRate
       currentClassLabel.text = currentClass
       totalClassLabel.text = totalClass
   }
    
    var month: Int = 0
       
    @IBOutlet weak var monthLable: UILabel!

   
    @IBAction func previousButton(_ sender: Any) {
        //추후 분기문으로 바운더리 지정
        if month > 1 {
            month -= 1
        } else {
            month = 12
        }
        setMonthLabel(month)
    }
   
    @IBAction func nextButton(_ sender: Any) {
        //추후 분기문으로 바운더리 지정
        if month < 12 {
            month += 1
        } else {
            month = 1
        }
        
        setMonthLabel(month)
    }
   
    func setMonthLabel(_ monthInput: Int){
        var monthStr: String
        monthStr = String(monthInput)
        month = monthInput
        monthLable.text = monthStr + "월 수업 일지"
    }
    
    var dropDown:DropDown?
    
    private var NotesInfos: [NotesInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDropDown() //드롭다운 박스
        setNotesInfos()
        setProgress()
        setMonthLabel(5) //5월로 초기 설정
        classHeaderHidden(true) // 처음엔 수업진행률 안보이도록 설정
        
        //기종별 최상단 헤더뷰 높이 조정
        viewHeaderHeight.constant = self.view.frame.height * 94/812
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        self.tableView.reloadData()

    }
    

    
    func listDropDown(){
        dropDown = DropDown()
        dropDown?.anchorView = dropboxbound
        self.dropDown?.width = 275
        DropDown.appearance().setupCornerRadius(7)
       
        // Top of drop down will be below the anchorView.
        dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!)
        
        // 드롭박스 목록 내역
        dropDown?.dataSource = ["전체", "신연상학생 수학 수업", "신연하학생 영어 수업"]
        listToggleButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        notesTitle.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
        
        // Action triggered on selection
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
            self.notesTitle.setTitle(item, for: .normal)
            if item != "전체" {
                self.classHeaderHidden(false)
            } else {
                self.classHeaderHidden(true)
            }
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

extension NotesVC: UITableViewDataSource, UITableViewDelegate{
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(NotesInfos.count) //Log
        return NotesInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let notesCell = tableView.dequeueReusableCell(withIdentifier: JournalDataCell.identifier, for: indexPath) as? JournalDataCell else { return UITableViewCell()}
        
        notesCell.setClassJournalInfo(classLog: NotesInfos[indexPath.row].classLog.getImageName(), currentClass: NotesInfos[indexPath.row].currentClass, lesson: NotesInfos[indexPath.row].lesson, homework: NotesInfos[indexPath.row].homework)
        
        return notesCell
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = JournalDateHeaderView(frame: CGRect(x: 0, y: 0, width: 375, height: 16))
        headerView.backgroundColor =  UIColor(red: 245 / 255, green: 246 / 255, blue: 250 / 255, alpha: 1.0)
        return headerView

    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
}
