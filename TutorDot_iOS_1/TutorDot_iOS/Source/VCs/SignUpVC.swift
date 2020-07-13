//
//  LoginVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UIGestureRecognizerDelegate {
    static let identifier: String = "SignUpVC"
    
   
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBOutlet weak var isTutorButton: UIButton!
    @IBOutlet weak var isTuteeButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // Constraint outlets
    @IBOutlet weak var stackHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoToStackHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackToTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordToCheckBoxHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var checkBoxToSignUphHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    
    @IBAction func checkBoxSelected(_ sender: UIButton) {
        if (checkBoxButton.isSelected == true)
        {
            checkBoxButton.setBackgroundImage(UIImage(named: "signupBtnAgreeUnpick"), for: .normal)

            checkBoxButton.isSelected = false;
        }
        else
        {
            checkBoxButton.setBackgroundImage(UIImage(named: "signupBtnAgreePick"), for: .normal)

            checkBoxButton.isSelected = true;
        }
//        sender.checkboxAnimation {
//        }
    }
    
    var isTutorBtn: Bool = false
    var isTuteeBtn: Bool = false
    var roleStatus: String = "tutor"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
        initGestureRecognizer()
        setUpConstraint()
        setTutorButton(true)
        print(roleStatus)
        
    }
    
    override func viewWillAppear(_ animated: Bool) { //
        registerForKeyboardNotifications()
    }


    
    func viewSetUp() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: nameTextField.frame.size.height - 1, width: nameTextField.frame.size.width, height: 0.8);
        bottomBorder.backgroundColor = UIColor.veryLightPink.cgColor
        nameTextField.layer.addSublayer(bottomBorder)
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRect(x: 0.0, y: emailTextField.frame.size.height - 1, width: emailTextField.frame.size.width, height: 0.8);
        bottomBorder2.backgroundColor = UIColor.veryLightPink.cgColor
        emailTextField.layer.addSublayer(bottomBorder2)
        
        let bottomBorder3 = CALayer()
        bottomBorder3.frame = CGRect(x: 0.0, y: passwordTextField.frame.size.height - 1, width: passwordTextField.frame.size.width, height: 0.8);
        bottomBorder3.backgroundColor = UIColor.veryLightPink.cgColor
        passwordTextField.layer.addSublayer(bottomBorder3)
        
        let bottomBorder4 = CALayer()
        bottomBorder4.frame = CGRect(x: 0.0, y: passwordConfirmTextField.frame.size.height - 1, width: passwordConfirmTextField.frame.size.width, height: 0.8);
        bottomBorder4.backgroundColor = UIColor.veryLightPink.cgColor
        passwordConfirmTextField.layer.addSublayer(bottomBorder4)
        
        
        signUpButton.backgroundColor = UIColor.softBlue
        signUpButton.layer.cornerRadius = signUpButton.frame.size.width/25
        personalInfoLabel.textColor = UIColor.brownGrey
    }
    
    func setUpConstraint() {
        logoToStackHeightConstraint.constant = (self.view.frame.height * 58/812)
        stackHeightConstraint.constant = (self.view.frame.height * 185/812)
        textFieldHeightConstraint.constant = self.view.frame.height * 38/812
        stackToTextHeightConstraint.constant = self.view.frame.height * 31/812
        passwordToCheckBoxHeightConstraint.constant = self.view.frame.height * 42/812
        checkBoxToSignUphHeightConstraint.constant = self.view.frame.height * 34/812
        bottomViewConstraint.constant = self.view.frame.height * 31/812
    

    }
    
    func setTutorButton(_ status: Bool) {
        if status {
            isTutorButton.setImage(UIImage(named: "signupBtnTutorPick"), for: .normal)
            isTutorBtn = true
        } else {
            isTutorButton.setImage(UIImage(named: "signupBtnTutorUnpick"), for: .normal)
            isTutorBtn = false
        }
    }
    
    func setTuteeButton(_ status: Bool) {
        if status {
            isTuteeButton.setImage(UIImage(named: "signupBtnTuteePick"), for: .normal)
            isTuteeBtn = true
        } else {
            isTuteeButton.setImage(UIImage(named: "signupBtnTuteeUnpick"), for: .normal)
            isTuteeBtn = false
        }
    }
    
    @IBAction func isTutorSelected(_ sender: Any) {
        if !isTutorBtn {
            setTutorButton(true)
            setTuteeButton(false)
            roleStatus = "tutor"
            print(roleStatus)
        } else {
            setTutorButton(false)
            roleStatus = "tutee"
        }
    }
    
    
    @IBAction func isTuteeSelected(_ sender: Any) {
        if !isTuteeBtn {
            setTutorButton(false)
            setTuteeButton(true)
            roleStatus = "tutee"
            print(roleStatus)
        } else {
            setTuteeButton(false)
            roleStatus = "tutor"
        }
    }
    
    
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) { //
        self.nameTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.passwordConfirmTextField.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() { //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 키보드가 생길 떄 텍스트 필드 위로 밀기
    @objc func keyboardWillShow(_ notification: NSNotification) { //
           
           guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
           guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
           
           guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
           
           let keyboardHeight: CGFloat // 키보드의 높이
           
           if #available(iOS 11.0, *) {
               keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
           } else {
               keyboardHeight = keyboardFrame.cgRectValue.height
           }
           
           // animation 함수
           // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
           // duration은 간격
           UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
               
               self.buttonStackView.alpha = 0
               
               // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.stackToTextHeightConstraint.constant = 0
            self.bottomViewConstraint.constant = +keyboardHeight/2 + 100
           })
           
           self.view.layoutIfNeeded()
       }
    
    // 키보드가 사라질 때 원래대로
    @objc func keyboardWillHide(_ notification: NSNotification) { //
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.buttonStackView.alpha = 1.0
            self.stackToTextHeightConstraint.constant = self.view.frame.height * 31/812
            self.bottomViewConstraint.constant = self.view.frame.height * 31/812
        })
        
        self.view.layoutIfNeeded()
    }
    
    // 이메일 포맷 맞는지 확인하는 함수
    func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
   
    
    @IBAction func loginButton(_ sender: Any) {
        // 회원가입 통신
        
        guard let inputName = nameTextField.text else { return }
        guard let inputEmail = emailTextField.text else { return }
        guard let inputPw = passwordTextField.text else { return }
        let inputRole = roleStatus
        
        
        SignUpService.shared.signup(userName: inputName, email: inputEmail, password: inputPw, role: inputRole) { networkResult in
            switch networkResult {
            case .success:
                // 회원가입에 성공했을때
                // 로그인 페이지로 값 넘겨주기
                guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC else {return}
                loginVC.emailTextField.text = inputEmail //id값 넘겨줌
                loginVC.passWordTextField.text = inputPw //pwd 값 넘겨줌
                self.navigationController?.show(loginVC, sender: self)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
                
            case .serverErr: print("serverErr")
                
            case .networkFail: print("networkFail") }
        }
        
        // 튜터, 튜티 선택 안했을 경우
        if !isTuteeBtn && !isTutorBtn {
            let alert = UIAlertController(title: "회원가입 실패", message: "튜터 혹은 튜티를 선택해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        // 회원가입 입력란이 비어있거나 다른 형식인 경우
        } else if nameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || passwordConfirmTextField.text!.isEmpty {
            let alert = UIAlertController(title: "회원가입 실패", message: "회원정보를 모두 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        // 이용 약관에 동의 안했을 경우
        } else if checkBoxButton.isSelected == false{
            let alert = UIAlertController(title: "회원가입 실패", message: "이용약관 및 개인정보보호정책에 동의해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        // 비밀번호 확인 일치하지 않을 경우
        } else if passwordTextField.text != passwordConfirmTextField.text {
            let alert = UIAlertController(title: "회원가입 실패", message: "비밀번호를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        // 이메일 형식 맞지 않을 경우
        } else if validateEmail(enteredEmail: emailTextField.text!) == false {
            let alert = UIAlertController(title: "회원가입 실패", message: "이메일 형식을 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        // 조건 충족 시 로그인 화면으로 넘어가기
        // 이메일, 비번 넘기기
        } else {
            guard let loginView = self.storyboard?.instantiateViewController(identifier:LoginVC.identifier) as? LoginVC else {
                return
            }

            if let email = self.emailTextField.text {
                loginView.emailText = email
            }

            if let password = self.passwordTextField.text {
                loginView.passwordText = password
            }

            loginView.modalPresentationStyle = .fullScreen

            self.present(loginView, animated: true, completion: nil)
        }
        
        //print(inputName, inputEmail, inputPw, inputRole)
    }
    



}


