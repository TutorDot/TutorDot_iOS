//
//  ClassInviteVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class ClassInviteVC: UIViewController {

    @IBOutlet weak var inviteCodeView: UIView!
    @IBOutlet weak var labelTopMarginConstraints: NSLayoutConstraint!
    @IBOutlet weak var headerHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var inviteCode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inviteCodeView.layer.cornerRadius = 5
        autoLayoutView()
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func autoLayoutView(){
        headerHeightConstraints.constant = self.view.frame.height * 94/812
        labelTopMarginConstraints.constant = self.view.frame.height * 233/812
    }
    
    @IBAction func copyButtonDidTap(_ sender: Any) {
        
        UIPasteboard.general.string = inviteCode.text
        
        let alertViewController = UIAlertController(title: "완료", message: "초대코드를 복사했습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
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
