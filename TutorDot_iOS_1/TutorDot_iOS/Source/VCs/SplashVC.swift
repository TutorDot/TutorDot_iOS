//
//  SplashVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 30/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit
import Lottie

class SplashVC: UIViewController {

    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    func setup(){
        //animationView 크기가 view와 같게
        animationView.frame = view.bounds
        //어떤 jsonv파일을 쓸지
        animationView.animation = Animation.named("splash_ios")
        //화면에 적합하게
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        //view안에 Subview로 넣어준다,
        view.addSubview(animationView)
        animationView.play()
    }

}
