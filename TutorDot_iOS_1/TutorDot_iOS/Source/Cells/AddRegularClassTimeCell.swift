//
//  AddRegularClassTimeCell.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/15.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class AddRegularClassTimeCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    static let identifier: String = "AddRegularClassTimeCell"
    
    @IBOutlet weak var classTimes: UITextField!
    
    let pickerView = UIPickerView()
    let toolbar = UIToolbar()
    let weekdays: [String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    let startHours: [String] = ["00", "01", "02", "03", "04", "05", "06","07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let startMins: [String] = ["00","30"]
    let endHours: [String] = ["00", "01", "02", "03", "04", "05", "06","07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let endMins: [String] = ["00","30"]
    
    //서버로 넘기고 + 텍스트 창에 띄울 String
    public var days: String = ""
    var startH: String = ""
    var startM: String = ""
    var endH: String = ""
    var endM: String = ""
    var ampm1: String = ""
    var ampm2: String = ""
    public var startTime: String = ""
    public var endTime: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTextField()
        createDatePicker()
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
//        guard let nextVC = storyBoard.instantiateViewController(withIdentifier: "MyClassAddVC") as? MyClassAddVC else {return}
//
//        nextVC.inputStartTime = self.startTime
//        nextVC.inputEndTime = self.endTime
//        nextVC.inputDate = self.days
//
//        print("데이터 전달!!!", days)
    }
    
    override func endEditing(_ force: Bool) -> Bool {
        super.endEditing(force)
        let storyBoard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let nextVC = storyBoard.instantiateViewController(withIdentifier: "MyClassAddVC") as? MyClassAddVC else { return false }
//        
//        //nextVC.setSchedule(days, startTime, endTime)
//    let newSchedule = Schedules(day: days, orgStartTime: startTime, orgEndTime: endTime)
//        print("new Schedule : ", newSchedule) //잘 찍힘!!!
//        nextVC.commitButtonDidTap(newSchedule)
//        //print(nextVC.schedule) //nil찍힘
        return true
    }
    
    func setTextField(){
            classTimes.layer.cornerRadius = 5
            classTimes.placeholder = "월요일 00:00 ~ 00:00"
            classTimes.addLeftPadding()
        }
        
        func createDatePicker(){
            toolbar.sizeToFit()
            var buttons = [UIBarButtonItem]()
            //print("dddddddddd")
            let doneButton = UIBarButtonItem(title: "완료", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "취소", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.cancelPressed))
            let titleBar = UIBarButtonItem(title: "시간 선택", style: UIBarButtonItem.Style.done, target: nil, action: nil)
            //let titleBar = ToolBarTitleItem(text: "시간 선택" , font: .systemFont(ofSize: 18), color: .black))
            let space1 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let space2 =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            
            //toolbar button color 설정
            titleBar.isEnabled = false
            titleBar.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.dark], for: .disabled)
            cancelButton.tintColor = UIColor.softBlue
            doneButton.tintColor = UIColor.softBlue
                
            //toolbar에 버튼 넣기
            buttons = [cancelButton, space1, titleBar, space2, doneButton]
            toolbar.setItems(buttons, animated: true)
            
            
            classTimes.inputAccessoryView = toolbar
            classTimes.inputView = pickerView
            
        }
        
        
        //toolbar actions
        @objc func donePressed(){
            
            //classTime.text = formatter.string(from: datePicker.date)
            self.endEditing(true)
            
            //print("dddddddddd")
            //toolbar.setToolbarHidden(false, animated: false)
        }
        @objc func cancelPressed(){
            self.endEditing(true)
            
            //print("cccccccccc")
            //toolbar.dismissViewControllerAnimated(true, completion: nil)
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 5
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            switch component {
            case 0:
                return weekdays.count
            case 1:
                return startHours.count
            case 2:
                return startMins.count
            case 3:
                return endHours.count
            case 4:
                return endMins.count
            default:
                return 1
            }
        }


        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           
    //        var row = pickerView.selectedRow(inComponent: 0)
    //        print("this is the pickerView\(row)")
            
            switch component {
            case 0:
                return weekdays[row]
            case 1:
                return startHours[row]
            case 2:
                return startMins[row]
            case 3:
                return endHours[row]
            case 4:
                return endMins[row]
            default:
                return ""
            }

        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            var startrow: Int = 0
            
            days = weekdays[pickerView.selectedRow(inComponent: 0)]
            
            if startHours[pickerView.selectedRow(inComponent: 1)] != "00" {
                startH = startHours[pickerView.selectedRow(inComponent: 1)]
                startrow = row
                pickerView.selectRow(startrow, inComponent: 3, animated: true)
                endH = endHours[pickerView.selectedRow(inComponent: 3)]
            }
            
            
            startM = startMins[pickerView.selectedRow(inComponent: 2)]
            endH = endHours[pickerView.selectedRow(inComponent: 3)]
            endM = endMins[pickerView.selectedRow(inComponent: 4)]
        
            
            if days == "" {
                days = weekdays[0]
            } else if startH == "" {
                startH = startHours[0]
            } else if startM == "" {
                startM = startMins[0]
            } else if endH == "" {
                endH = endHours[0]
            } else if endM == "" {
                endM = endMins[0]
            }
            
            // pm과 am으로 구분하기
            // 00~12 -> 시간 그대로, 13~23 -> 시간 1-11까지 쓰기
            // 00~11 -> am, 12~23 -> pm
            
            //starttime 가공
            if Int(startH)! >= 0 && Int(startH)! < 12 {
                ampm1 = "am"
            } else if Int(startH)! > 12 && Int(startH)! < 24 {
                ampm1 = "pm"
            }
            //endtime 가공
            if Int(endH)! >= 0 && Int(endH)! < 12 {
                ampm2 = "am"
            } else if Int((endH))! > 12 && Int((endH))! < 24 {
                ampm2 = "pm"
            }
            
            //13~23시 가공
            if Int(startH)! > 12 {
                var newStartH: Int = Int(startH)! - 12
                startH = String(newStartH)
                if startH.count < 2 {
                    startH = "0" + startH
                }
            }
            //13~23시 가공
            if Int(endH)! > 12 {
                var newEndH: Int = Int(endH)! - 12
                endH = String(newEndH)
                if endH.count < 2 {
                    endH = "0" + endH
                }
            }
            
            startTime = startH + ":" + startM + ampm1
            endTime = endH + ":" + endM + ampm2
            classTimes.text = days + " " + startH + ":" + startM + ampm1 + " ~ " + endH + ":" + endM + ampm2
            
            
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
             switch component {
               case 0:
                   return 70
               case 1:
                   return 50
               case 2:
                   return 50
               case 3:
                   return 50
               case 4:
                   return 50
               default:
                   return 1
            }
        }

}
