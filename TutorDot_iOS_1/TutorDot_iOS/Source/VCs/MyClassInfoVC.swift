//
//  MyClassInfoVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/15.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MyClassInfoVC: UIViewController {
    
    static let idnetifier: String = "MyClassInfoVC"
    var myRole: String?
    @IBOutlet weak var classTimeHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var headerHeightContraints: NSLayoutConstraint!
    @IBOutlet weak var classColorImage: UIImageView!
    @IBOutlet weak var TutorProfileImage: UIImageView!
    @IBOutlet weak var tutorName: UILabel!
    @IBOutlet weak var tutorIntro: UILabel!
    @IBOutlet weak var timeAndPrice: UILabel!
    @IBOutlet weak var bankAccountInfo: UILabel!
    @IBOutlet weak var regularClassTime: UILabel!
    @IBOutlet weak var classPlace: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var stackList: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimesData()
        autoLayoutView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if myRole == "튜티" {
            //튜티일경우 과외 초대 및 편집버튼 숨기기
            stackList.subviews[6].isHidden = true
            editButton.isHidden = true
        }
    }
    
    func autoLayoutView(){
        headerHeightContraints.constant = self.view.frame.height * 94/812
    }
    func setTimesData(){
        let classTimeBasicHeight: CGFloat = 83
        var timesList: [String] = []
        var printtimeList: String = ""
        //시간 데이터 받아와서 추가
        timesList.append("월 01:00pm~03:00pm")
        timesList.append("금 01:00pm~03:00pm")
        for i in timesList {
            print(i)
            printtimeList += i
            printtimeList += "\n"
        }
        regularClassTime.text = printtimeList
        classTimeHeightConstraints.constant = classTimeBasicHeight + CGFloat((timesList.count * 20))
    }
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "MypageClassEditVC")
        nextVC.modalPresentationStyle = .currentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func inviteButtonDidTap(_ sender: Any) {
        //TuteeInviteCodeVC
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "TuteeInviteCodeVC")
        nextVC.modalPresentationStyle = .currentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
        
        
        //TutorInviteCodeVC
        
    }
    
    @IBAction func unconnectButtonDidTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "LeaveClassVC")
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        present(popupVC, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

