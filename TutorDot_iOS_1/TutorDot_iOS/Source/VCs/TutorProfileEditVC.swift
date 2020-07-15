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
   
    @IBOutlet weak var profileImage: UIButton!
    private var imagePickerController = UIImagePickerController()
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introMention.layer.cornerRadius = 5
        introMention.placeholder = "글자수 제한 18자 이내"
        introMention.addLeftPadding()
//        profileImage.imageView?.contentMode = .scaleAspectFit
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        imagePickerController.delegate = self
        viewWillAppear(true)
        //lookupProfile()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        lookupProfile()
    }
    
    private func lookupProfile(){
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        ProfileService.shared.setMyProfile(token) { networkResult in
            switch networkResult {
            case .success(let profileData):
                guard let profileData = profileData as? UserProfile else { return }
                print(profileData.profileURL)
                self.profileImageView.setImage(from: profileData.profileURL)
            case .requestErr(let message): print(message)
            case .pathErr:
                print("pathErr")
            case .serverErr: print("ServerErr")
            case .networkFail: print("networkReult")
                
            }
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
    }
    
    @IBAction func setProfile(_ sender: Any) {
        onClickButton()
    }
    
    func onClickButton(){
        let alertController = UIAlertController(title: "프로필 설정", message: "프로필 사진을 선택하세요!", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "사진앨범", style: .default) { action in self.openLibrary()
        }
        let photoAction = UIAlertAction(title: "카메라", style: .default) { action in self.openCamera()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(galleryAction)
        alertController.addAction(photoAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension TutorProfileEditVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func openLibrary(){
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.modalPresentationStyle = .currentContext
        imagePickerController.modalTransitionStyle = .crossDissolve
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func openCamera(){
        imagePickerController.sourceType = .camera
        imagePickerController.modalPresentationStyle = .currentContext
        imagePickerController.modalTransitionStyle = .crossDissolve
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}
