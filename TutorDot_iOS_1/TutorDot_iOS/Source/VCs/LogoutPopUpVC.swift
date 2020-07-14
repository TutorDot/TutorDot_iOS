//
//  LogoutPopUpVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/09.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LogoutPopUpVC: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 5
        logoutButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonDidTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Login", bundle: nil)
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
