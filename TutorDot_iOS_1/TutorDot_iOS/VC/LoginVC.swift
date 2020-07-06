//
//  LoginVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let tabbarStoryboard = UIStoryboard.init(name: "MainTab", bundle: nil)
        guard let tabView = tabbarStoryboard.instantiateViewController(identifier:"TabbarVC") as? TabbarVC else {
            return
        }
        
        tabView.modalPresentationStyle = .fullScreen
        
        self.present(tabView, animated: true, completion: nil)
        
//        self.present(tabView, animated: true, completion: {if let tabView = self.navigationController {
//            tabView.modalPresentationStyle = .fullScreen
//            }})
//
//        receiveViewController.modalPresentationStyle = .fullScreen
//
//        self.present(receiveViewController, animated: true, completion: nil)
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
