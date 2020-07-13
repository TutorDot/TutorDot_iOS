//
//  Extension+ViewController.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/14.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
  public func setupGestureRecognizerEx() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapEx(_:)))
    view.addGestureRecognizer(tap)
  }
  
  @objc func handleTapEx(_ gesture: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  public func registerForKeyboardNotificationsEx() {
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShowEx(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHideEx(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  public func unregisterForKeyboardNotificationsEx() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShowEx(_ notificatoin: Notification) {
    let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let keyboardSize = (notificatoin.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let height = keyboardSize.height - view.safeAreaInsets.bottom
    
    /*
        애니메이션 처리
    */
  }
  
  @objc func keyboardWillHideEx(_ notificatoin: Notification) {
    
    let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    
    /*
        애니메이션 처리
    */
  }
}
