//
//  SplashVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var logoTopMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoTopMargin.constant = self.view.frame.height * 184/812
        
        //3초 후 자동화면전환
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            let nextVC = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "OnboardingVC") 
            nextVC.modalPresentationStyle = .currentContext
            nextVC.modalTransitionStyle = .crossDissolve
            self.present(nextVC, animated: true, completion: nil)
        })
        // Do any additional setup after loading the view.
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
