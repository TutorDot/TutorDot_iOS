//
//  MyClassAddVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MyClassAddVC: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var classTitle: UITextField!
    @IBOutlet weak var classHours: UITextField!
    @IBOutlet weak var classPrice: UITextField!
    @IBOutlet weak var tutorBankName: UITextField!
    @IBOutlet weak var tutorBankAccount: UITextField!
    @IBOutlet weak var classTimeAddButton: UIButton!
    @IBOutlet weak var classPlace: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var headerHeightContraints: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var isSelectedYellow: Bool = false
    var isSelectedRed: Bool = false
    var isSelectedGreen: Bool = false
    var isSelectedBlue: Bool = false
    var isSelectedPurple: Bool = false
    
    //스택뷰 height 배열
    var stackViewHeights: [Int] = [116, 108, 95, 90, 102, 59]
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    //정규수업시간 개수 배열
    var regularClassTime: [String] = []
    var nowEditingField: Int = 0
    //정규수업시간 날짜, 시작시간, 끝시간 - 서버에 넘길 데이터
    var inputDate: String = ""
    var inputStartTime: String = ""
    var inputEndTime: String = ""
    var price: String = ""
    var hours: String = ""
    var schedule: [Schedules] = []
    
    let eachCellHeight: CGFloat = 49
    var classColor: String? = ""
    
    @IBOutlet weak var infoWrap: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceholder()
        autoLayoutView()
        tableView.delegate = self
        tableView.dataSource = self
        
        initGestureRecognizer()
        registerForKeyboardNotifications()
        
        tableViewHeightConstraint.constant = 0
        
    }
    func autoLayoutView(){
        headerHeightContraints.constant = self.view.frame.height * 94/812
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func commitButtonDidTap(_ sender: Any) {

        
        
//        if sender is Schedules {
//            schedule.append(sender as! Schedules)
//            print("wow!!!!!!", schedule)
//        }
//
        
        
        //self.schedule!.append(Schedules(day: inputDate, orgStartTime: inputStartTime, orgEndTime: inputEndTime))
        //self.tableView.reloadData()
        
        
        guard let lectureName = classTitle.text else { return }
        guard let color = classColor else { return }
        guard let schedules = schedule as? [Schedules] else { return }
        guard let orgLocation = classPlace.text else { return }
        guard let bank = tutorBankName.text else { return }
        guard let accountNumber = tutorBankAccount.text else { return }
        guard let totalHours = Int(hours) else { return }
        guard let price = Int(price) else { return }
        
        AddLectureService.shared.addLecture(lectureName, color, schedules, orgLocation, bank, accountNumber, totalHours, price){
            networkResult in
            switch networkResult {
            case .success(let token):
                print("schedule!!!!", self.schedule as Any)
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                print("addLecture 서버연결 성공")
                //서버 전송 성공 후 기존 마이페이지 화면으로 이동
                self.dismiss(animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "수업 추가 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr:
                print("pathError")
            case .serverErr:
                print("server error")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
    
//    func setSchedule(_ date: String,_ start: String,_ end: String){
//        //let newSchedule = Schedules(day: date, orgStartTime: start, orgEndTime: end)
//        //schedule?.append(newSchedule)
//        //print(schedule?.count, "append success", schedule)
////        self.tableView.reloadData()
////        inputDate = date
////        inputStartTime = start
////        inputEndTime = end
//
//    }
    
    func setPlaceholder(){
        
        classPrice.addLeftPadding()
        classTitle.addLeftPadding()
        classHours.addLeftPadding()
        classPlace.addLeftPadding()
        tutorBankAccount.addLeftPadding()
        tutorBankName.addLeftPadding()
        
        classTitle.layer.cornerRadius = 5
        classHours.layer.cornerRadius = 5
        classPrice.layer.cornerRadius = 5
        tutorBankName.layer.cornerRadius = 5
        tutorBankAccount.layer.cornerRadius = 5
        classTimeAddButton.layer.cornerRadius = 5
        classPrice.layer.cornerRadius = 5
        
        classTitle.placeholder = "글자수 제한 18자 이내"
        classHours.placeholder = "00 시간"
        classPrice.placeholder = "00 만원"
        tutorBankName.placeholder = "카카오뱅크"
        tutorBankAccount.placeholder = "83191012665607"
        classPlace.placeholder = "위치 입력 (글자수 제한없습니다)"
        
    }

    func callSelectAction(){
           setColorButton(isSelectedYellow, "yellow")
           setColorButton(isSelectedRed, "red")
           setColorButton(isSelectedBlue, "blue")
           setColorButton(isSelectedGreen, "green")
           setColorButton(isSelectedPurple, "purple")
       }
    
    func setColorButton(_ status: Bool, _ color: String){
        if status {
            classColor = color
            switch color {
            case "yellow":
                yellowButton.setImage(UIImage(named: "myClassTapEditImgSelectYellow"), for: .normal)
                isSelectedYellow = true
            case "red":
                redButton.setImage(UIImage(named: "myClassTapEditImgSelectRed"), for: .normal)
                isSelectedRed = true
            case "green":
                greenButton.setImage(UIImage(named: "myClassTapEditImgSelectGreen"), for: .normal)
                isSelectedGreen = true
            case "blue":
                blueButton.setImage(UIImage(named: "myClassTapEditImgSelectBlue"), for: .normal)
                isSelectedBlue = true
            case "purple":
                purpleButton.setImage(UIImage(named: "myClassTapEditImgSelectPurple"), for: .normal)
                isSelectedPurple = true
            default:
                print("default")
            }
            
        } else {
            switch color {
            case "yellow":
                yellowButton.setImage(UIImage(named: "yellow"), for: .normal)
                isSelectedYellow = false
            case "red":
                redButton.setImage(UIImage(named: "red"), for: .normal)
                isSelectedRed = false
            case "green":
                greenButton.setImage(UIImage(named: "green"), for: .normal)
                isSelectedGreen = false
            case "blue":
                blueButton.setImage(UIImage(named: "blue"), for: .normal)
                isSelectedBlue = false
            case "purple":
                purpleButton.setImage(UIImage(named: "purple"), for: .normal)
                isSelectedPurple = false
            default:
                print("default")
            }
        }
    }
    
    @IBAction func yellowButtonDidTap(_ sender: Any) {
        if isSelectedYellow{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
            callSelectAction()
        } else {
            isSelectedYellow = true
            isSelectedRed = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func redButtonDidTap(_ sender: Any) {
        if isSelectedRed{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedRed = true
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func greenButtonDidTap(_ sender: Any) {
        if isSelectedGreen{
           isSelectedRed = false
           isSelectedYellow = false
           isSelectedBlue = false
           isSelectedGreen = false
           isSelectedPurple = false
       } else {
           isSelectedGreen = true
           isSelectedYellow = false
           isSelectedRed = false
           isSelectedBlue = false
           isSelectedPurple = false
       }
       callSelectAction()
    }
    
    @IBAction func blueButtonDidTap(_ sender: Any) {
        if isSelectedBlue{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedYellow = false
            isSelectedRed = false
            isSelectedBlue = true
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func purpleButtonDidTap(_ sender: Any) {
        if isSelectedPurple{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedYellow = false
            isSelectedRed = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = true
        }
        callSelectAction()
    }
    
    @IBAction func regularClassAddButton(_ sender: Any) {
        regularClassTime.append("셀 추가")
        tableView.reloadData()
        tableViewHeightConstraint.constant = CGFloat(regularClassTime.count) * eachCellHeight
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        print(regularClassTime)
    }
    
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
       
        self.classTitle.resignFirstResponder()
        self.classHours.resignFirstResponder()
        self.classPrice.resignFirstResponder()
        self.tutorBankAccount.resignFirstResponder()
        self.tutorBankName.resignFirstResponder()
        self.classPlace.resignFirstResponder()
        self.classTimeAddButton.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() { //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func classTitleDidTap(_ sender: Any) {
        nowEditingField = 0
    }
    @IBAction func timeDidTap(_ sender: Any) {
        nowEditingField = 1
    }
    
    @IBAction func priceDidTap(_ sender: Any) {
        nowEditingField = 2
    }
    
    @IBAction func bankDidTap(_ sender: Any) {
        nowEditingField = 3
    }
    
    @IBAction func accountDidTap(_ sender: Any) {
        nowEditingField = 4
    }
    
    @IBAction func placeDidTap(_ sender: Any) {
        nowEditingField = 5
    }
    
    @IBAction func classTimesBtnDidPress(_ sender: Any) {
        nowEditingField = 5
    }
    
    @IBAction func classTimesTextDidPress(_ sender: Any) {
        nowEditingField = 5
    }
    
    
    @IBAction func hoursPlaceholder(_ sender: Any) {
        if classHours.text != "" {
            var str: String = classHours.text ?? ""
            price = str
            str += " 시간"
            classHours.text = str
        }
    }
    
    @IBAction func pricePlaceholder(_ sender: Any) {
        if classPrice.text != "" {
            var str: String = classPrice.text ?? ""
            hours = str
            str += " 만원"
            classPrice.text = str
        }
    }
    
    
    // 키보드가 생길 떄 텍스트 필드 위로 밀기
    @objc func keyboardWillShow(_ notification: NSNotification) { //
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
           guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            print(self.nowEditingField)
            
            switch self.nowEditingField {
            case 0:
                self.infoWrap.isHidden = false
            case 1, 2:
                self.infoWrap.subviews[0].isHidden = true
                self.infoWrap.subviews[1].isHidden = true
                self.infoWrap.subviews[2].isHidden = true
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[3]+self.stackViewHeights[4]+self.stackViewHeights[5])
            case 3, 4:
                self.infoWrap.subviews[0].isHidden = true
                self.infoWrap.subviews[1].isHidden = true
                self.infoWrap.subviews[2].isHidden = true
                self.infoWrap.subviews[3].isHidden = true
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[4]+self.stackViewHeights[5])
            case 5 :
                self.infoWrap.subviews[0].isHidden = true
                self.infoWrap.subviews[1].isHidden = true
                self.infoWrap.subviews[2].isHidden = true
                self.infoWrap.subviews[3].isHidden = true
                self.infoWrap.subviews[4].isHidden = true
                
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[5])
            default :
                print("else")
            }
            
            self.view.layoutIfNeeded()
            
        })
        
        self.view.layoutIfNeeded()
    }
    
    // 키보드가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) { //
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            
            // 원래대로 돌아가도록
           switch self.nowEditingField {
           case 0:
                self.infoWrap.isHidden = false
                self.stackViewHeight.constant = 570
           case 1, 2:
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.infoWrap.subviews[2].isHidden = false
                self.stackViewHeight.constant = 570
           case 3, 4:
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.infoWrap.subviews[2].isHidden = false
                self.infoWrap.subviews[3].isHidden = false
                self.stackViewHeight.constant = 570
           case 5 :
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.infoWrap.subviews[2].isHidden = false
                self.infoWrap.subviews[3].isHidden = false
                self.infoWrap.subviews[4].isHidden = false
                self.stackViewHeight.constant = 570
            default :
                self.stackViewHeight.constant = 570
                print("default")
            }
            //self.nowEditingField = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
}

extension MyClassAddVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.regularClassTime.count == 0 {
            return 0
        } else {
            return 49
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("new cell")
        //print(regularClassTime.count)
        return regularClassTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: AddRegularClassTimeCell.identifier, for: indexPath) as? AddRegularClassTimeCell else { return UITableViewCell()}
        cell.delegate = self
        
        return cell

    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//
//    }
    
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddRegularClassTimeCell.identifier, for: indexPath) as? AddRegularClassTimeCell else { return }
//        
//        print("editing ggggg")
//    }

    
}

extension MyClassAddVC: AddRegularClassTimeCellDelegate {
    func setScheduler(_ date: String, _ start: String, _ end: String) {
        let newSchedule = Schedules(day: date, orgStartTime: start, orgEndTime: end)
        schedule.append(newSchedule)
        print(schedule.count, "append success", schedule)
    }
}
