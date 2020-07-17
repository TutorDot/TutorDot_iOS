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
    @IBOutlet weak var monthJournalView: UIView!
    
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
  
    @IBOutlet weak var monthJournalViewHeight: NSLayoutConstraint!
    
    func classHeaderHidden(_ ishide: Bool){
        progressViewWrap.subviews[0].isHidden = ishide
        if ishide { //true(안보일때)
            tableViewTopMargin.constant = 191-117
        } else { //false (보일때)
            tableViewTopMargin.constant = 191
        }
    }
    
    func monthHeaderHidden(_ ishide: Bool){
        if ishide { //true(안보일때)
//            monthJournalViewHeight.constant = 50
////            UIView.monthJournalView.animate(withDuration: 0.5) {
////                self.view.layoutIfNeeded()
////            }
//            tableViewTopMargin.constant = 191-117-24
//            print("50")
        } else { //false (보일때)
//            monthJournalViewHeight.constant = 74
//            if notesTitle.currentTitle == "전체"{
//                tableViewTopMargin.constant = 191-117
//            } else {
//                tableViewTopMargin.constant = 191
//            }
        }
    }
    
    func setProgress(){
        progressView.layer.cornerRadius = 9
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 9
        progressView.subviews[1].clipsToBounds = true
        
        progressView.tintColor = UIColor.init(named: "Color")
        progressView.progressViewStyle = .default
        UIView.animate(withDuration: 4.0) {
            self.progressView.setProgress(12/16, animated: true)
        }
        //progressView.progress = 12/16 //0.2로 두고 테스트
        //progressLabel.text = String(12/16*100) + "%"
        progressLabel.text = "75%"
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
        setMonthLabel(7) //5월로 초기 설정
        classHeaderHidden(true) // 처음엔 수업진행률 안보이도록 설정
        
        //기종별 최상단 헤더뷰 높이 조정
        viewHeaderHeight.constant = self.view.frame.height * 94/812
        
        //스크롤 시 0월 수업일지 부분 숨기기
       // swipeAction()
        
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
        let data1 = NotesInfo(classLog: .yellow, currentClass: "1회차 2시간/8시간", lesson: "수학의정석 1장", homework: "수학의정석 1장 연습문제", lid: 10, classDate: "2020-07-18")
        let data2 = NotesInfo(classLog: .yellow, currentClass: "2회차 4시간/8시간", lesson: "수학의정석 2장", homework: "수학의정석 2장 연습문제", lid: 10, classDate: "2020-07-18")
        let data3 = NotesInfo(classLog: .yellow, currentClass: "3회차 6시간/8시간", lesson: "수학의정석 3장", homework: "수학의정석 3장 연습문제", lid: 10, classDate: "2020-07-18")
        let data4 = NotesInfo(classLog: .yellow, currentClass: "4회차 8시간/8시간", lesson: "수학의정석 4장", homework: "수학의정석 4장 연습문제", lid: 10, classDate: "2020-07-18")
        let data5 = NotesInfo(classLog: .red, currentClass: "1회차 1시간/6시간", lesson: "통기타 너도 할수 있어! 1장", homework: "수학의정석 4장 연습문제", lid: 10, classDate: "2020-07-18")
        let data6 = NotesInfo(classLog: .red, currentClass: "2회차 10시간/16시간", lesson: "통기타 너도 할수 있어! 2장", homework: "너에게 난 나에게 넌", lid: 10, classDate: "2020-07-18")
        let data7 = NotesInfo(classLog: .red, currentClass: "3회차 10시간/16시간", lesson: "통기타 너도 할수 있어! 3장", homework: "제주도의 푸른 밤", lid: 10, classDate: "2020-07-18")
        let data8 = NotesInfo(classLog: .red, currentClass: "4회차 10시간/16시간", lesson: "통기타 너도 할수 있어! 4장", homework: "징가징가~", lid: 10, classDate: "2020-07-18")
        let data9 = NotesInfo(classLog: .red, currentClass: "5회차 10시간/16시간", lesson: "통기타 너도 할수 있어! 5장", homework: "붉은 노을", lid: 10, classDate: "2020-07-18")
        let data10 = NotesInfo(classLog: .red, currentClass: "6회차 10시간/16시간", lesson: "통기타 너도 할수 있어! 6장", homework: "겨울을 걷는다", lid: 10, classDate: "2020-07-18")
        
        NotesInfos = [data1, data2, data3, data4, data5, data6, data7, data8, data9, data10]
    }
    
    // 아래로 스크롤(스와이프)시 0월 수업일지 뷰 숨기기 / 나타내기
//    func swipeAction(){
//        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(NotesVC.respondToSwipeGesture(_:)))
//        swipeUp.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeUp)
//
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(NotesVC.respondToSwipeGesture(_:)))
//        swipeDown.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeDown)
//    }
//
//    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
//            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.up{
//                print("위로 스크롤 내리고 있음요")
//                monthHeaderHidden(true)
//            } else if swipeGesture.direction == UISwipeGestureRecognizer.Direction.down{
//                print("아래로 스크롤 해또요")
//                monthHeaderHidden(false)
//            }
//        }
//    }
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
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        monthHeaderHidden(true)
        //위로 스크롤하면!! (노션에 적기!!!!!)
        if scrollView.contentOffset.y == 0 {
            monthHeaderHidden(false)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: NotesModifyVC.identifier) as? NotesModifyVC else {return}
        
        nextVC.modalPresentationStyle = .currentContext
        
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
    }
   
}
