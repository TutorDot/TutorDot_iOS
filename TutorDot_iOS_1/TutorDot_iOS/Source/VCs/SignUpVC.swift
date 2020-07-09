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
    
    @IBOutlet weak var buttonCollectionView: UICollectionView!
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBOutlet weak var textFieldtoCollectionView: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
        buttonCollectionView.reloadData()
        textFieldSetUp()
        initGestureRecognizer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) { //
        registerForKeyboardNotifications()
    }
    
    func textFieldSetUp() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: nameTextField.frame.size.height - 1, width: nameTextField.frame.size.width, height: 1.0);
        bottomBorder.backgroundColor = UIColor.veryLightPink.cgColor
        nameTextField.layer.addSublayer(bottomBorder)
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRect(x: 0.0, y: emailTextField.frame.size.height - 1, width: emailTextField.frame.size.width, height: 1.0);
        bottomBorder2.backgroundColor = UIColor.veryLightPink.cgColor
        emailTextField.layer.addSublayer(bottomBorder2)
        
        let bottomBorder3 = CALayer()
        bottomBorder3.frame = CGRect(x: 0.0, y: passwordTextField.frame.size.height - 1, width: passwordTextField.frame.size.width, height: 1.0);
        bottomBorder3.backgroundColor = UIColor.veryLightPink.cgColor
        passwordTextField.layer.addSublayer(bottomBorder3)
        
        let bottomBorder4 = CALayer()
        bottomBorder4.frame = CGRect(x: 0.0, y: passwordConfirmTextField.frame.size.height - 1, width: passwordConfirmTextField.frame.size.width, height: 1.0);
        bottomBorder4.backgroundColor = UIColor.veryLightPink.cgColor
        passwordConfirmTextField.layer.addSublayer(bottomBorder4)
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
               
               self.buttonCollectionView.alpha = 0
               
               // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
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
            self.buttonCollectionView.alpha = 1.0
            self.bottomViewConstraint.constant = 51
        })
        
        self.view.layoutIfNeeded()
    }
    
   
    
    @IBAction func loginButton(_ sender: Any) {
        let tabbarStoryboard = UIStoryboard.init(name: "MainTab", bundle: nil)
        guard let tabView = tabbarStoryboard.instantiateViewController(identifier:"TabbarVC") as? TabbarVC else {
            return
        }
        tabView.modalPresentationStyle = .fullScreen
        
        self.present(tabView, animated: true, completion: nil)
    
    }
    
    

}

extension SignUpVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let buttonCell = SignUpCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        buttonCell.tutorLabel1.text = "dddd"
        return buttonCell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
        
        
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    }


}
