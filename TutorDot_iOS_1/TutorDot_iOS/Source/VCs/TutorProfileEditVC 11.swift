//
//  TutorProfileEditVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TutorProfileEditVC: UIViewController {

    @IBOutlet weak var introMention: UITextField!
    @IBOutlet weak var tutorImage: UIImageView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introMention.layer.cornerRadius = 5
        introMention.placeholder = "글자수 제한 18자 이내"
        introMention.addLeftPadding()
        tutorImage.layer.cornerRadius = tutorImage.frame.width / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
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
