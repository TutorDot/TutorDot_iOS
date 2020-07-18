//
//  SplashVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
//import SwiftyGif
import Lottie

class SplashVC: UIViewController {

    let animationView = AnimationView()

    @IBOutlet weak var subTitleHeight: NSLayoutConstraint!
    @IBOutlet weak var subtitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLayout()
        //3초 후 자동화면전환
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            let nextVC = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "OnboardingVC") 
            nextVC.modalPresentationStyle = .currentContext
            nextVC.modalTransitionStyle = .crossDissolve
            self.present(nextVC, animated: true, completion: nil)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup(){ //lottie 버전
        //animationView 크기가 view와 같게
        animationView.frame = view.bounds
        //어떤 jsonv파일을 쓸지
        animationView.bringSubviewToFront(subtitle)
        animationView.animation = Animation.named("data3")
        //화면에 적합하게
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        //view안에 Subview로 넣어준다,
        view.addSubview(animationView)
        view.addSubview(subtitle)
        self.subtitle.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            UIView.animate(withDuration: 0.7) {
                self.subtitle.alpha = 1
            }
        })
        

       
        animationView.play()
    }

    func titleLayout(){
        subTitleHeight.constant = view.frame.height * (405/812)
    }
}
