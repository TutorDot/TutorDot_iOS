//
//  InviteCodeVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class InviteCodeVC: UIViewController {

    @IBOutlet weak var inviteCodeView: UIView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var labelTopMarginConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var headerHeightContraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inviteCodeView.layer.cornerRadius = 5
        connectButton.layer.cornerRadius = 8
        autoLayoutView()
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func autoLayoutView(){
        headerHeightContraints.constant = view.frame.height * 94/812
        labelTopMarginConstraints.constant = view.frame.height * 203/812
        
    }
    
    @IBAction func connectedButtonDidTap(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "MainTab", bundle: nil)
        
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "TabbarVC")
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
        
    }
    
}
