//
//  OnboardingVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/10.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    static let identifier : String = "OnboardingVC"
    let numOfTouchs: Int = 2
    
    @IBOutlet weak var isMemberLabel: UILabel!
    
    @IBOutlet weak var startButtonTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var memberCheckHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var imageConstraints: NSLayoutConstraint!
    @IBOutlet weak var textTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var topMarginConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var onboardingTitle: UIStackView!
    @IBOutlet weak var mainTitleStackView: UIStackView!
    
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
        
        
        setOnboardingImage()
        setUnderImage(0)
        setImage(0)
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
        
        autoLayoutView()
    }
    
    func setOnboardingImage(){
        let totalHeight : CGFloat = view.frame.height
        //분기 처리!!!!!!!!!아이폰 기종에 따른 이미지 사이즈 조정
        switch totalHeight {
        case 667.0 :
            print("iPhone8")
        case 812.0 :
            print("iPhone11Pro")
        default :
            print("iPhone8, 11Pro 아님")
        }
        
        imageSet.append(UIImage(named: "onboardingImgStart")!)
        imageSet.append(UIImage(named: "onboardingImgCalender")!)
        imageSet.append(UIImage(named: "onboardingImgClassLog")!)
        imageSet.append(UIImage(named: "onboardingImgNotice")!)
    }
    func autoLayoutView(){
         let totalHeight : CGFloat = view.frame.height
        //분기 처리!!!!!!!!!아이폰 기종에 따른 이미지 사이즈 조정
        switch totalHeight {
        case 667.0 :
            //print("iPhoine 8 start")
            topMarginConstraints.constant = (totalHeight * 97/812)-20
            textTopConstraints.constant = (totalHeight * 97/812)-20
            imageConstraints.constant = 28
            buttonHeightConstraints.constant = totalHeight * (48/812)
            onboardingTitle.spacing = 6.0
            mainTitleStackView.spacing = 2.0
            mainTitle1.font = mainTitle1.font.withSize(21)
            mainTitle2.font = mainTitle2.font.withSize(21)
            subTitle.font = subTitle.font.withSize(14)
            memberCheckHeight.constant = totalHeight * (48/812)
            isMemberLabel.font = mainTitle1.font.withSize(14)
            startButtonTopConstraints.constant = totalHeight * (25/812)
        case 812.0 :
            topMarginConstraints.constant = 97
            textTopConstraints.constant = 95
            imageConstraints.constant = 0
            mainTitle1.font = mainTitle1.font.withSize(23)
            mainTitle2.font = mainTitle2.font.withSize(23)
            subTitle.font = subTitle.font.withSize(15)
            isMemberLabel.font = mainTitle1.font.withSize(14)
        default :
            print("iPhone8, 11Pro 아님")
        }
       
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            // 발생한 이벤트의 방향이 왼쪽 스와이프라며 onBoarding 이미지 변경
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.left{
                if onBoardCount < 3 {
                    onBoardCount += 1
                    onBoardingImage.alpha = 0.2
                    onBoardingImage.image = imageSet[onBoardCount]
                    setUnderImage(onBoardCount)
                    UIView.animate(withDuration: 0.7) {
                        self.onBoardingImage.alpha = 1
                    }
                }
            } else if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right{
                if onBoardCount > 0 {
                    onBoardCount -= 1
                    onBoardingImage.alpha = 0.2
                    onBoardingImage.image = imageSet[onBoardCount]
                    setUnderImage(onBoardCount)
                    UIView.animate(withDuration: 0.7) {
                        self.onBoardingImage.alpha = 1
                    }
                }
            }
        }
    }

    func setImage(_ index: Int) {
        onBoardingImage.image = imageSet[index]
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
    
    
    @IBAction func startButtonSelected(_ sender: Any) {
        
        let joinStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let joinView = joinStoryboard.instantiateViewController(identifier: SignUpVC.identifier) as? SignUpVC else {
                    return
                }
                joinView.modalPresentationStyle = .fullScreen
            
                self.present(joinView, animated: true, completion: nil)
        }
    
    
    @IBAction func loginButtonSelected(_ sender: Any) {
        let joinStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let joinView = joinStoryboard.instantiateViewController(identifier: LoginVC.identifier) as? LoginVC else {
                    return
                }
                joinView.modalPresentationStyle = .fullScreen
            
                self.present(joinView, animated: true, completion: nil)
    }
    
}
