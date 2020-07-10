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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inviteCodeView.layer.cornerRadius = 5
        connectButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
