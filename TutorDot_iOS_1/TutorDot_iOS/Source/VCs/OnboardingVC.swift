//
//  OnboardingVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    let numOfTouchs = 2
    
    @IBOutlet weak var isMemberView: UIStackView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    @IBOutlet weak var underImage1: UIImageView!
    @IBOutlet weak var underImage2: UIImageView!
    @IBOutlet weak var underImage3: UIImageView!
    @IBOutlet weak var underImage4: UIImageView!
    
    @IBOutlet weak var mainTitle1: UILabel!
    @IBOutlet weak var mainTitle2: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    @IBAction func startButtonDidTap(_ sender: Any) {
        let nextVC = UIStoryboard(name: "MainTab", bundle: nil).instantiateViewController(withIdentifier: "TabbarVC")
        nextVC.modalPresentationStyle = .currentContext
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
    }
    
    var onBoardCount: Int = 0
    var imageSet = [UIImage]()
    var mainTitles1 = ["", "튜티와 튜터의 ", "나만의 ", "잊지않게 "]
    var mainTitles2 = ["", " 공유 캘린더", " 수업일지", " 알림체크"]
    var subTitles = ["", "캘린더로 수업일정을 한눈에 정리해 보세요!", "수업일지로 지난 수업정보를 확인해 보세요!", "수업관리에 필요한 알림들을 받아 보세요!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 8
        imageSet.append(UIImage(named: "ColorImgRed")!)
        imageSet.append(UIImage(named: "ColorImgYellow")!)
        imageSet.append(UIImage(named: "ColorImgGreen")!)
        imageSet.append(UIImage(named: "ColorImgBlue")!)
        
        setUnderImage(0)
        setTitles(0)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingVC.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingVC.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingVC.respondToSwipeGesture(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingVC.respondToSwipeGesture(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            // 발생한 이벤트의 방향이 왼쪽 스와이프라며 onBoarding 이미지 변경
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.left{
                if onBoardCount < 3 {
                    onBoardCount += 1
                    onBoardingImage.image = imageSet[onBoardCount]
                    setUnderImage(onBoardCount)
                }
            } else if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right{
                if onBoardCount > 0 {
                    onBoardCount -= 1
                    onBoardingImage.image = imageSet[onBoardCount]
                    setUnderImage(onBoardCount)
                }
            }
        }
    }

    func setUnderImage(_ index: Int){
        setTitles(index)
        
        switch index {
        case 0:
            underImage1.image = UIImage(named: "onboardingBtnPick")
            underImage2.image = UIImage(named: "onboardingBtnUnpick")
            underImage3.image = UIImage(named: "onboardingBtnUnpick")
            underImage4.image = UIImage(named: "onboardingBtnUnpick")
        case 1:
            underImage1.image = UIImage(named: "onboardingBtnUnpick")
            underImage2.image = UIImage(named: "onboardingBtnPick")
            underImage3.image = UIImage(named: "onboardingBtnUnpick")
            underImage4.image = UIImage(named: "onboardingBtnUnpick")
        case 2:
            underImage1.image = UIImage(named: "onboardingBtnUnpick")
            underImage2.image = UIImage(named: "onboardingBtnUnpick")
            underImage3.image = UIImage(named: "onboardingBtnPick")
            underImage4.image = UIImage(named: "onboardingBtnUnpick")
        case 3:
            underImage1.image = UIImage(named: "onboardingBtnUnpick")
            underImage2.image = UIImage(named: "onboardingBtnUnpick")
            underImage3.image = UIImage(named: "onboardingBtnUnpick")
            underImage4.image = UIImage(named: "onboardingBtnPick")
        default:
            print("default")
        }
    }
    
    func setTitles(_ index: Int){
        mainTitle1.text = mainTitles1[index]
        mainTitle2.text = mainTitles2[index]
        subTitle.text = subTitles[index]
    }

}
