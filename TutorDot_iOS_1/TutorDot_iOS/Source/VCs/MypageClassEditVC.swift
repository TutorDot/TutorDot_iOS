//
//  MypageClassEditVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/09.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MypageClassEditVC: UIViewController, UIGestureRecognizerDelegate {

    var titleEdit: String?
    var color: String?
    var price: String?
    var hours: String?
    var times: [String]?
    var place: String?
    var account: String?
    var bank: String?
    
    static let isclassTimePressed: Bool = false
    var myRoleSet: String = ""
    @IBOutlet weak var classTitle: UITextField!
    @IBOutlet weak var classHours: UITextField!
    @IBOutlet weak var classPrice: UITextField!
    
    @IBOutlet weak var classPlace: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var classAddButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    
    let eachCellHeight: CGFloat = 49
 
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var headerHeightContraints: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var infoWrap: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    //스택뷰 height 배열
    var stackViewHeights: [Int] = [110, 95, 90, 102, 59]
    
    //정규수업시간 배열
    var regularClassTime: [String] = ["월 01:00pm ~ 03:00pm", "금 01:00pm ~ 03:00pm"]
    
    
//    regularClassTime.append("월 01:00pm ~ 03:00pm")
//    regularClassTime.append("금 01:00pm ~ 03:00pm")
    //tableView의 textfield
    var classTimeTextField = RegularClassHoursViewCell().classTime
    
    var nowEditingField: Int = 0
    
    var isSelectedYellow: Bool = false
    var isSelectedRed: Bool = false
    var isSelectedGreen: Bool = false
    var isSelectedBlue: Bool = false
    var isSelectedPurple: Bool = false
    
   
    //guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        receiveData()
        tableView.delegate = self
        tableView.dataSource = self
        yellowButtonStart()
        initGestureRecognizer()
        registerForKeyboardNotifications()
        autoLayoutView()
        
        tableViewHeightConstraint.constant = eachCellHeight * CGFloat(regularClassTime.count)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //if regularClassTime.count == 0 {
        //tableViewHeightConstraint.constant = 0
        //}
        
    }
    
    func autoLayoutView(){
        headerHeightContraints.constant = self.view.frame.height * 94/812
    }
    
    @IBAction func commitButtonDidTap(_ sender: Any) {
        
        let alertViewController = UIAlertController(title: "완료", message: "수업정보를 변경했습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    
    func setTextFields(){
        
        classTitle.addLeftPadding()
        classHours.addLeftPadding()
        classPrice.addLeftPadding()
        accountNumber.addLeftPadding()
        classPlace.addLeftPadding()
        
        classTitle.layer.cornerRadius = 5
        classHours.layer.cornerRadius = 5
        classPrice.layer.cornerRadius = 5
        bankName.layer.cornerRadius = 5
        accountNumber.layer.cornerRadius = 5
        classAddButton.layer.cornerRadius = 5
        classPlace.layer.cornerRadius = 5
        
        classTitle.placeholder = "수업명을 입력해주세요"
        classHours.placeholder = "00 시간"
        classPrice.placeholder = "00 만원"
        bankName.placeholder = "카카오뱅크"
        accountNumber.placeholder = "123456789123"
        classPlace.placeholder = "수업 장소를 입력해주세요"
        
    }
    
    func receiveData(){
        classTitle.text = titleEdit
        classHours.text = hours
        classPrice.text = price
        bankName.text = bank
        accountNumber.text = account
        classPlace.text = place
    }
    func callSelectAction(){
        setColorButton(isSelectedYellow, "yellow")
        setColorButton(isSelectedRed, "red")
        setColorButton(isSelectedBlue, "blue")
        setColorButton(isSelectedGreen, "green")
        setColorButton(isSelectedPurple, "purple")
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    
    func yellowButtonStart(){
        
        isSelectedBlue = true
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
    
    func setColorButton(_ status: Bool, _ color: String){
         if status {
           //classColor = color
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
    
    //Mark: 새로 배운 내용!!!! 추가 RegularClassHoursViewCell까지
    @IBAction func regularClassAddButton(_ sender: Any) {
        regularClassTime.append("여기를 눌러 시간을 설정해주세요!")
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
        self.bankName.resignFirstResponder()
        self.accountNumber.resignFirstResponder()
        self.classPlace.resignFirstResponder()
        self.classAddButton.resignFirstResponder()
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
            str += " 시간"
            classHours.text = str
        }
    }
    
    @IBAction func pricePlaceholder(_ sender: Any) {
        if classPrice.text != "" {
            var str: String = classPrice.text ?? ""
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
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[2]+self.stackViewHeights[3]+self.stackViewHeights[4])
            case 3, 4:
                self.infoWrap.subviews[0].isHidden = true
                self.infoWrap.subviews[1].isHidden = true
                self.infoWrap.subviews[2].isHidden = true
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[3]+self.stackViewHeights[4])
            case 5 :
                self.infoWrap.subviews[0].isHidden = true
                self.infoWrap.subviews[1].isHidden = true
                self.infoWrap.subviews[2].isHidden = true
                self.infoWrap.subviews[3].isHidden = true
                self.stackViewHeight.constant = CGFloat(self.stackViewHeights[4])
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
                self.stackViewHeight.constant = 456
           case 1, 2:
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.stackViewHeight.constant = 456
           case 3, 4:
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.infoWrap.subviews[2].isHidden = false
                self.stackViewHeight.constant = 456
           case 5 :
                self.infoWrap.subviews[0].isHidden = false
                self.infoWrap.subviews[1].isHidden = false
                self.infoWrap.subviews[2].isHidden = false
                self.infoWrap.subviews[3].isHidden = false
                self.stackViewHeight.constant = 456
            default :
                self.stackViewHeight.constant = 456
                print("default")
            }
            //self.nowEditingField = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
}


extension MypageClassEditVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if regularClassTime.count == 0 {
            return 0
        } else {
            return 49
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("new cell")
        print(regularClassTime.count)
        return regularClassTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: RegularClassHoursViewCell.identifier, for: indexPath) as? RegularClassHoursViewCell else { return UITableViewCell()}
        cell.classTime.text = regularClassTime[indexPath.row]
        return cell

    }
}
