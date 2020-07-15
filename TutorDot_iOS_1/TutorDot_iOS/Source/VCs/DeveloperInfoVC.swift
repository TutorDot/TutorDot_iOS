
//
//  DeveloperInfoVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class DeveloperInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayoutView()
    }
    @IBOutlet weak var headerHeightContraints: NSLayoutConstraint!
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var scrollViewButtom: NSLayoutConstraint!
   
    func autoLayoutView(){
        headerHeightContraints.constant = self.view.frame.height * 94/812
    }

}
