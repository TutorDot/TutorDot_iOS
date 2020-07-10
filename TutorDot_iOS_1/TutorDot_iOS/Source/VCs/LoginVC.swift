//
//  LoginVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UIGestureRecognizerDelegate {
    static let identifier : String = "LoginVC"

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var emailText = ""
    var passwordText = ""
    
    
    @IBOutlet weak var imageToTextHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
        initGestureRecognizer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) { //
        registerForKeyboardNotifications()
    }
    
    func viewSetUp() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: emailTextField.frame.size.height - 1, width: emailTextField.frame.size.width, height: 0.8);
        bottomBorder.backgroundColor = UIColor.veryLightPink.cgColor
        emailTextField.layer.addSublayer(bottomBorder)
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRect(x: 0.0, y: passWordTextField.frame.size.height - 1, width: passWordTextField.frame.size.width, height: 0.8);
        bottomBorder2.backgroundColor = UIColor.veryLightPink.cgColor
        passWordTextField.layer.addSublayer(bottomBorder2)
    
        loginButton.backgroundColor = UIColor.softBlue
        loginButton.layer.cornerRadius = loginButton.frame.size.width/25
        
        // 이메일, 비번 받아오기
        emailTextField.text = emailText
        passWordTextField.text = passwordText
    }
    
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) { //
        self.emailTextField.resignFirstResponder()
        self.passWordTextField.resignFirstResponder()

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
               
               self.imageView.alpha = 0
               
               // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            //self.imageToTextHeightConstraint.constant = 0
            self.bottomViewConstraint.constant = +keyboardHeight/2 + 100
           })
           
           self.view.layoutIfNeeded()
       }
    
    // 키보드가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) { //
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.imageView.alpha = 1.0
            self.bottomViewConstraint.constant = 123
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    @IBAction func loginButtontapped(_ sender: Any) {
        
            let tabbarStoryboard = UIStoryboard.init(name: "MainTab", bundle: nil)
            guard let tabView = tabbarStoryboard.instantiateViewController(identifier:"TabbarVC") as? TabbarVC else {
                return
            }
            tabView.modalPresentationStyle = .fullScreen
        
            self.present(tabView, animated: true, completion: nil)
    }
    
    

}
