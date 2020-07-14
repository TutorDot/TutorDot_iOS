//
//  MyPageVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var classCollectionView: UICollectionView!
    
    @IBOutlet weak var myClassAdd: UIView!
    @IBOutlet weak var tutorImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMyClassInfos()
        setSettingView()
        setMyclassViews()
        
        gotoProfileEdit()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        classCollectionView.delegate = self
        classCollectionView.dataSource = self
        classCollectionView.isScrollEnabled = true
        classCollectionView.contentSize = CGSize(width: 112, height: self.classCollectionView.frame.height)
    }
    
    func setMyclassViews(){
        myClassAdd.layer.cornerRadius = 7
    }
    
    //상단 콜렉션 뷰에서 쓸 리스트
    private var MyClassInfos: [MyClassInfo] = []
    //하단 테이블 뷰에서 쓸 리스트
    private var Alert: [MypageInfo] = []
    private var Info: [MypageInfo] = []
    private var Service: [MypageInfo] = []
    
    func setMyClassInfos(){
        let myClass1 = MyClassInfo(classColor: .yellow, classTitle: "계속 생각 날 코딩수업(더 길게도 입력 가능!)", tutee1: "myImgGrayCircle", tutee2: "myImgGrayCircle")
        let myClass2 = MyClassInfo(classColor: .red, classTitle: "계속 생각 날 스위프트수업", tutee1: "myImgGrayCircle", tutee2: "myImgGrayCircle")
        let myClass3 = MyClassInfo(classColor: .purple, classTitle: "계속 생각 날 깃수업", tutee1: "myImgGrayCircle", tutee2: "myImgGrayCircle")
        
        MyClassInfos = [myClass1, myClass2, myClass3]
    }
    
    func setSettingView(){
        let alert1 = MypageInfo(title: "수업료 알림")
        let alert2 = MypageInfo(title: "수업 시작 전 알림")
        let info1 = MypageInfo(title: "버전정보")
        let info2 = MypageInfo(title: "개발자정보")
        let service1 = MypageInfo(title: "비밀번호 변경")
        let service2 = MypageInfo(title: "로그아웃")
        let service3 = MypageInfo(title: "서비스 탈퇴")
        
        Alert = [alert1, alert2]
        Info = [info1, info2]
        Service = [service1, service2, service3]
    }
    
    // 프로필 이미지 뷰 선택시 프로필 편집 화면으로 화면전환
    func gotoProfileEdit(){
        tutorImage.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.profileDidTap))
        tutorImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func profileDidTap(){
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let TutorProfileEditVC = storyBoard.instantiateViewController(withIdentifier: "TutorProfileEditVC")
        TutorProfileEditVC.modalPresentationStyle = .currentContext
        TutorProfileEditVC.modalTransitionStyle = .crossDissolve
        present(TutorProfileEditVC, animated: true, completion: nil)
    }
    
    @IBAction func addClassButtonDidTap(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "MypageClassEditVC")
        nextVC.modalPresentationStyle = .currentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    
}

extension MyPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            print(Alert.count)
            return Alert.count
        case 1 :
            print(Info.count)
            return Info.count
        case 2 :
            print(Service.count)
            return Service.count
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageNoticeSettingCell.identifier, for: indexPath) as? MypageNoticeSettingCell else { return UITableViewCell()}
            
            cell.setTitleInfo(Alert[indexPath.row].title)
            return cell
        case 1 :
            if indexPath.row == 0 {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageInfoCell.identifier, for: indexPath) as? MypageInfoCell else { return UITableViewCell()}
                cell.setTitleInfo(Info[indexPath.row].title)
                cell.hiddenButton()
                cell.setVersionLabel()
                
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageInfoCell.identifier, for: indexPath) as? MypageInfoCell else { return UITableViewCell()}
                cell.setTitleInfo(Info[indexPath.row].title)
                return cell
            }
            
        case 2 :
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageServiceCell.identifier, for: indexPath) as? MypageServiceCell else { return UITableViewCell()}
            cell.setTitleInfo(Service[indexPath.row].title)
            return cell
            
            
        default :
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 10)
        view.backgroundColor = UIColor(red: 245 / 255, green: 246 / 255, blue: 250 / 255, alpha: 1.0)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            print("d")
        case 1:
             if indexPath.row == 1 { //개발자정보 클릭 시
                let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
                let nextVC = storyBoard.instantiateViewController(withIdentifier: "DeveloperInfoVC")
                nextVC.modalPresentationStyle = .currentContext
                nextVC.modalTransitionStyle = .crossDissolve
                present(nextVC, animated: true, completion: nil)
            }
        case 2:
            if indexPath.row == 1 { //로그아웃 클릭 시
                let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
                let popupVC = storyBoard.instantiateViewController(withIdentifier: "LogoutPopupVC")
                popupVC.modalPresentationStyle = .currentContext
                popupVC.modalTransitionStyle = .crossDissolve
                present(popupVC, animated: true, completion: nil)
            } else if indexPath.row == 2 { //서비스탈퇴 클릭 시
                let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
                let popupVC = storyBoard.instantiateViewController(withIdentifier: "LeaveServiceVC")
                popupVC.modalPresentationStyle = .overCurrentContext
                popupVC.modalTransitionStyle = .crossDissolve
                present(popupVC, animated: true, completion: nil)
            }
            print("ddd")
        default:
            print("dddd")
        }
    }
}


extension MyPageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MyClassInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClassCell.identifier, for: indexPath) as? MyClassCell else { return UICollectionViewCell() }
        cell.setMyClassInfo(classColor: MyClassInfos[indexPath.row].classColor.getImageName(), classTitle: MyClassInfos[indexPath.row].classTitle, Tutee1: MyClassInfos[indexPath.row].tutee1, Tutee2: MyClassInfos[indexPath.row].tutee2)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
            let popupVC = storyBoard.instantiateViewController(withIdentifier: "MypageClassEditVC")
            popupVC.modalPresentationStyle = .currentContext
            popupVC.modalTransitionStyle = .crossDissolve
            present(popupVC, animated: true, completion: nil)
        case 1:
            print("2")
        case 2 :
            print("3")
        default:
            print("default")
        }
    }
}
