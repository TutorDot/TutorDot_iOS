//
//  MypageClassEditVC.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/09.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class MypageClassEditVC: UIViewController {



    @IBOutlet weak var classTitle: UITextField!
    @IBOutlet weak var hoursAndPrice: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var classPlace: UITextField!
    
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    var isSelectedYellow: Bool = false
    var isSelectedRed: Bool = false
    var isSelectedGreen: Bool = false
    var isSelectedBlue: Bool = false
    var isSelectedPurple: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        // Do any additional setup after loading the view.
    }
    
    func setTextFields(){
        
        classTitle.addLeftPadding()
        hoursAndPrice.addLeftPadding()
        accountNumber.addLeftPadding()
        classPlace.addLeftPadding()
        
        classTitle.layer.cornerRadius = 5
        hoursAndPrice.layer.cornerRadius = 5
        bankName.layer.cornerRadius = 5
        accountNumber.layer.cornerRadius = 5
        classPlace.layer.cornerRadius = 5
        
        classTitle.placeholder = "수업명을 입력해주세요"
        hoursAndPrice.placeholder = "00시간 / 000만원"
        bankName.placeholder = "카카오뱅크"
        accountNumber.placeholder = "123456789123"
        classPlace.placeholder = "수업 장소를 입력해주세요"
        
    }
    
    func callSelectAction(){
        setColorButton(isSelectedYellow, "yellow")
        setColorButton(isSelectedRed, "red")
        setColorButton(isSelectedBlue, "blue")
        setColorButton(isSelectedGreen, "green")
        setColorButton(isSelectedPurple, "purple")
    }
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func yellowButtonDidTap(_ sender: Any) {
        if isSelectedYellow{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
            callSelectAction()
        } else {
            isSelectedYellow = true
            isSelectedRed = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func redButtonDidTap(_ sender: Any) {
        if isSelectedRed{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedRed = true
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func greenButtonDidTap(_ sender: Any) {
        if isSelectedGreen{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedGreen = true
            isSelectedYellow = false
            isSelectedRed = false
            isSelectedBlue = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func blueButtonDidTap(_ sender: Any) {
        if isSelectedBlue{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedYellow = false
            isSelectedRed = false
            isSelectedBlue = true
            isSelectedGreen = false
            isSelectedPurple = false
        }
        callSelectAction()
    }
    
    @IBAction func purpleButtonDidTap(_ sender: Any) {
        if isSelectedPurple{
            isSelectedRed = false
            isSelectedYellow = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = false
        } else {
            isSelectedYellow = false
            isSelectedRed = false
            isSelectedBlue = false
            isSelectedGreen = false
            isSelectedPurple = true
        }
        callSelectAction()
    }
    
    func setColorButton(_ status: Bool, _ color: String){
        if status {
            switch color {
            case "yellow":
                yellowButton.setImage(UIImage(named: "myClassTapEditImgSelectYellow"), for: .normal)
                isSelectedYellow = true
            case "red":
                redButton.setImage(UIImage(named: "myClassTapEditImgSelectRed"), for: .normal)
                isSelectedRed = true
            case "green":
                greenButton.setImage(UIImage(named: "myClassTapEditImgSelectGreen"), for: .normal)
                isSelectedGreen = true
            case "blue":
                blueButton.setImage(UIImage(named: "myClassTapEditImgSelectBlue"), for: .normal)
                isSelectedBlue = true
            case "purple":
                purpleButton.setImage(UIImage(named: "myClassTapEditImgSelectPurple"), for: .normal)
                isSelectedPurple = true
            default:
                print("default")
            }
            
        } else {
            switch color {
            case "yellow":
                yellowButton.setImage(UIImage(named: "ColorImgYellow"), for: .normal)
                isSelectedYellow = false
            case "red":
                redButton.setImage(UIImage(named: "ColorImgRed"), for: .normal)
                isSelectedRed = false
            case "green":
                greenButton.setImage(UIImage(named: "ColorImgGreen"), for: .normal)
                isSelectedGreen = false
            case "blue":
                blueButton.setImage(UIImage(named: "ColorImgBlue"), for: .normal)
                isSelectedBlue = false
            case "purple":
                purpleButton.setImage(UIImage(named: "ColorImgPurple"), for: .normal)
                isSelectedPurple = false
            default:
                print("default")
            }
        }
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

