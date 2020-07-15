//
//  CalendarVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//
import UIKit
import DropDown

protocol CalendarViewControllerDeleagte {
    func didSelectDate(dateString: String)
}

class CalendarVC: UIViewController {
    
    static let identifier: String = "CalendarVC"
    // 변수 설정
    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var lastWeekDayOfMonth = 0
    var currentMonthIndexConstant = 0
    var delegate: CalendarViewControllerDeleagte?
    var dropDown: DropDown?
    var classList: [Tutor] = [] // 받아오는 더미 데이터
    var classDateList: [Tutor] = [] // 날짜별 일정 리턴 데이터
    var classList2: [CalendarData] = [] // 서버에서 받아오는 날짜 데이터

    var index: IndexPath?
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var tutorCollectionView: UICollectionView!
    // Button settings
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownLabelButton: UIButton!
    @IBOutlet weak var topDateButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var dateHeaderLabel: UILabel!
    @IBOutlet weak var monthHeaderLabel: UILabel!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var calendarCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!
    // calendarView 전체 모양 설정
    @IBOutlet weak var calendarView: UIView! {
        didSet {
            calendarView.layer.cornerRadius = 20
            calendarView.layer.shadowRadius = 10
            calendarView.layer.shadowColor = UIColor.gray.cgColor
            calendarView.layer.shadowOffset = CGSize(width: 1, height: 1)
            calendarView.layer.shadowOpacity = 0.5
        }
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setupViewControllerUI()
           setupCalendar()
           setListDropDown()
           self.view.bringSubviewToFront(calendarView)
           setClassList()
           setUpView()
    }

    // Dropdown
     func setListDropDown(){
         dropDown = DropDown()
         dropDown?.anchorView = anchorView
         self.dropDown?.width = anchorView.frame.size.width
         self.dropDown?.backgroundColor = UIColor.white
         self.dropDown?.selectionBackgroundColor = UIColor.paleGrey
         self.dropDown?.cellHeight = 41
         DropDown.appearance().setupCornerRadius(7)
        
         // 라벨로부터 아래로 6pt 떨어져서 박스가 보이게 하기위해 +6을 해주었다.
         dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
         //dropDown?.
         
         // 드롭박스 목록 내역
         dropDown?.dataSource = ["전체", "류세화학생 수학 수업", "최인정학생 영어 수업"]
         dropDownButton.addTarget(self, action: #selector(dropDownToggleButton), for: .touchUpInside)
         
         // Action triggered on selection
         dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in
             self.dropDownLabelButton.setTitle(item, for: .normal)
             
         }

         // 드롭박스 내 text 가운데 정렬
         dropDown?.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
             // Setup your custom UI components
             cell.optionLabel.textAlignment = .center
         }
     }
     
     func setUpView() {
         self.headerView.sendSubviewToBack(anchorView)
         anchorView.frame.size.width = headerView.frame.size.width / 1.2
        headerViewHeightConstraint.constant = view.frame.height * 94/812
        
        if self.view.frame.size.height > 800 {
            self.calendarCollectionViewHeightConstraint.constant = 290
            self.calendarViewHeightConstraint.constant = 400
        } else {
            self.calendarCollectionViewHeightConstraint.constant = 280
            self.calendarViewHeightConstraint.constant = 380
        }

        
     }
     
     @objc func dropDownToggleButton(){
         dropDown?.show()
     }
    
    @IBAction func leftButtonSelected(_ sender: Any) {
        currentMonthIndex -= 1
        
        if currentMonthIndex < 0 {
            currentMonthIndex = 11
            currentYear -= 1
        }
        topDateButton.setTitle("\(currentYear)년 \(months[currentMonthIndex])", for: .normal)
        
        if currentMonthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[currentMonthIndex] = 29
            } else {
                numOfDaysInMonth[currentMonthIndex] = 28
            }
        }
        firstWeekDayOfMonth = getFirstWeekDay()
        dateCollectionView.reloadData()
    }
    
    
    @IBAction func rightButtonSelected(_ sender: Any) {
        currentMonthIndex += 1
        
        // currentMonth가 12월인 경우 0으로 reset 하고 currentYear++
        if currentMonthIndex > 11 {
            currentMonthIndex = 0
            currentYear += 1
        }
        topDateButton.setTitle("\(currentYear)년 \(months[currentMonthIndex])", for: .normal)
        
        if currentMonthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[currentMonthIndex] = 29
            } else {
                numOfDaysInMonth[currentMonthIndex] = 28
            }
        }
        firstWeekDayOfMonth = getFirstWeekDay()
        dateCollectionView.reloadData()
    }
    
    
    @IBAction func plusButtonSelected(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: ClassAddVC.identifier) as? ClassAddVC else {return}
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: true, completion: nil)
        
        
    }
    
    func setClassList() {
        let info1 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "류세화님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-20", classLog: Tutor.ClassLogColor.blue)
        let info2 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "류세화님의 영어과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-21", classLog: Tutor.ClassLogColor.yellow)
        let info3 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "최인정님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-22", classLog: Tutor.ClassLogColor.green)
        let info4 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "강병헌님의 자바과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-20", classLog: Tutor.ClassLogColor.green)
        let info5 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "김은희님의 디자인과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-16", classLog: Tutor.ClassLogColor.blue)
        let info6 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "최인정님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-5", classLog: Tutor.ClassLogColor.red)
        let info7 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "신연상님의 영어과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-20", classLog: Tutor.ClassLogColor.yellow)
        let info8 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "최인정님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-8-11", classLog: Tutor.ClassLogColor.yellow)
        let info9 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "최인정님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-8-26", classLog: Tutor.ClassLogColor.blue)
        let info10 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "최인정님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-8-21", classLog: Tutor.ClassLogColor.blue)
        let info11 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "이희수님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", classDate: "2020-7-16", classLog: Tutor.ClassLogColor.red)
        
        classList = [info1, info2, info3, info4, info5, info6, info7, info8, info9, info10, info11]
        //classList = []
    }
    
    

}

extension CalendarVC {
    func setupViewControllerUI() {
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        tutorCollectionView.delegate = self
        tutorCollectionView.dataSource = self
            
    }
    
    func setupCalendar() {
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentMonthIndexConstant = Calendar.current.component(.month, from: Date())
        currentMonthIndex -= 1 // bcz apple calendar returns months starting from 1
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        firstWeekDayOfMonth = getFirstWeekDay() //4
        lastWeekDayOfMonth = getLastWeekDay()
        print("마지막 요일", lastWeekDayOfMonth)
        //for leap years, make february month of 29 days
        if currentMonthIndex == 1 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex] = 29
        }
        
        //end
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        // display current month name in title
        topDateButton.setTitle("\(currentYear)년 \(months[currentMonthIndex])", for: .normal)
        
        // 처음 열었을 때 오늘 날짜로 보이기
        dateHeaderLabel.text = String(todaysDate)
        monthHeaderLabel.text = String("\(presentMonthIndex+1)월")
    }
 
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex+1)-01".date?.firstDayOfTheMonth.weekday)!
        return day
    }
    
    func getLastWeekDay() -> Int {
        let lastDay = ("\(currentYear)-\(currentMonthIndex+1)-01".date?.lastDayOfTheMonth.weekday)!
        return lastDay
    }
}


extension CalendarVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 날짜 뷰
        if collectionView == self.dateCollectionView {
            // 위 아래 빈 셀들을 위해서
            let count = numOfDaysInMonth[currentMonthIndex] + firstWeekDayOfMonth + 8
            return count
        } else {
            // 해당 날짜에 수업이 없을 시 수업 추가 셀 리턴
            if classDateList.count == 0 {
                return 1
            } else {
                print("섹션 수", classDateList.count)
                return classDateList.count
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendarCell = CalendarCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        let tutorInfoCell = TutorCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        let tutorBlankCell = TutorBlankCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)

        let currentMonthCalendarIndex = currentMonthIndex + 1
        let currentDateCalendarIndex = todaysDate
        print("바뀔때", currentMonthCalendarIndex, currentDateCalendarIndex)

        // CalendarCollectionView
        if collectionView == self.dateCollectionView {
            // 다음 달로 넘어가면 선택한 날짜 색 초기화
            calendarCell.dateView.backgroundColor = UIColor.white

            // 첫 화면에 오늘 날짜 리턴
            print ("tes", calendarCell.dateLabel.text, currentDateCalendarIndex)
//            if calendarCell.dateLabel.text == String(todaysDate){
//
//                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
//                calendarCell.dateView.backgroundColor = UIColor.softBlue
//                calendarCell.dateLabel.textColor = UIColor.white
//
//            }
            
            // 이전 달 cell 표시
            if indexPath.item <= firstWeekDayOfMonth - 2 {
                calendarCell.isHidden = false
                calendarCell.dateLabel.textColor = UIColor.veryLightPinkThree
                let prevDate = indexPath.row-firstWeekDayOfMonth+(numOfDaysInMonth[currentMonthIndex-1]+2)
                print("첫째 요일", firstWeekDayOfMonth)
                calendarCell.dateLabel.text="\(prevDate)"
                calendarCell.isUserInteractionEnabled = false
                
                calendarCell.image1.image = UIImage(named: "")
                calendarCell.image2.image = UIImage(named: "")
                calendarCell.image3.image = UIImage(named: "")
                
                return calendarCell
            } // 이후 달 표시
            else if indexPath.item >= firstWeekDayOfMonth + (numOfDaysInMonth[currentMonthIndex]-1) {

                calendarCell.dateLabel.textColor = UIColor.veryLightPinkThree
    
                calendarCell.image1.image = UIImage(named: "")
                calendarCell.image2.image = UIImage(named: "")
                calendarCell.image3.image = UIImage(named: "")
                
                let nextDate = (indexPath.item )
                calendarCell.dateLabel.text = "\(nextDate)"
                calendarCell.isUserInteractionEnabled = false
                return calendarCell
            } // 이번달 표시
            else {
                let calcDate = indexPath.row-firstWeekDayOfMonth+2
                calendarCell.isHidden = false
                calendarCell.dateLabel.textColor = UIColor.black
                calendarCell.dateLabel.text="\(calcDate)"
                calendarCell.dateLabel.textColor = UIColor.black
                calendarCell.isUserInteractionEnabled = true
                calendarCell.backgroundColor = UIColor.white

                calendarCell.image1.image = UIImage(named: "")
                calendarCell.image2.image = UIImage(named: "")
                calendarCell.image3.image = UIImage(named: "")
                           
                // 오늘 날짜인 셀 찾아서 셀렉해놓기
                if String(currentDateCalendarIndex) == calendarCell.dateLabel.text && String(currentMonthIndexConstant) == String(currentMonthIndex+1) {
                    calendarCell.dateView.backgroundColor = UIColor.softBlue
                    calendarCell.dateLabel.textColor = UIColor.white
                    self.index = indexPath
                }
                
                // 달력에 날짜 별 일정 점 찍기
                for i in 0..<classList.count {
                    let classDateMonth = classList[i].classDate.components(separatedBy: "-")[1]
                    let classDateDay = classList[i].classDate.components(separatedBy: "-")[2]
                    // 셀의 월, 일과 일치할때 점 찍기
                    print("month", String(currentMonthCalendarIndex), classDateMonth)
                    //print("day", calendarCell.dateLabel.text, classDateDay)
                    if classDateMonth == String(currentMonthCalendarIndex) && classDateDay == calendarCell.dateLabel.text {
                        print ("인덱스", String(presentMonthIndex+1), classDateMonth)
                        let imageName = classList[i].classLog.getImageName()
                        print("이미지 이름", imageName, currentMonthIndex)
                        if calendarCell.image1.image == UIImage(named: "") {
                            calendarCell.image1.image = UIImage(named: imageName)
                        } else if calendarCell.image2.image == UIImage(named: "") {
                            calendarCell.image2.image = UIImage(named: imageName)
                        } else {
                            calendarCell.image3.image = UIImage(named: imageName)
                        }
                    }
                }
                
            }
            return calendarCell
        }
        // TutorCollectionView
        else {
            // 해당 날짜에 수업이 없을 경우
            
            if classDateList.count == 0 {
                // 빈 셀 리턴
                tutorBlankCell.isUserInteractionEnabled = false
                return tutorBlankCell
                
            // 해당 날짜에 수업이 있을 경우
            } else {
                
                tutorInfoCell.infoView.frame.size.width = tutorInfoCell.frame.size.width/2
                tutorInfoCell.set(classDateList[indexPath.row])
                
                return tutorInfoCell
            }
        }
    
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 캘린더 컬렉션 뷰
        if collectionView == self.dateCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
            
            
            // 날짜 선택시 셀 색깔 바뀌기
            cell?.dateView.backgroundColor = UIColor.veryLightPinkTwo
            cell?.dateLabel.textColor = UIColor.black
            
//            let cellIndex = indexPath[1] // try without [1] returns a list.
            print("indexpath", indexPath[1])
    
            if let date = cell?.dateLabel.text! {
                print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
                // 날짜 선택시 헤더 날짜 레이블 바뀌기
                dateHeaderLabel.text = date
                monthHeaderLabel.text = "\(currentMonthIndex+1)월"
                
                // 선택된 날짜 다른 뷰컨에서 쓰기
                self.delegate?.didSelectDate(dateString: "\(currentYear)-\(currentMonthIndex+1)-\(date)")
                tutorCollectionView.reloadData() // 다른 날짜 클릭시 초기화
                
                
                // 날짜별로 해당하는 수업 리턴하기
                // 선택한 날짜에 일치하는 데이터를 새로운 리스트에 append 해주기
                for index in 0..<classList.count {
                    if classList[index].classDate == "\(currentYear)-\(currentMonthIndex+1)-\(date)" {
                        print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
                        print("success")
                        //print(classList[index])
                        classDateList.append(classList[index])
                        tutorCollectionView.reloadData()
                        print(classDateList)
                        
                    } else {
                        //classDateList.removeAll()
                        print("failed")
                    }
                }
                
            }
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as? TutorCollectionViewCell
            let calendarCell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
            
            guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: ClassEditVC.identifier) as? ClassEditVC else {return}
            
            // 과외 리스트가 있을 때에만
            if classList.count > 0 {

                // 뷰컨 ClassEditVC로 넘어가기
                receiveViewController.modalPresentationStyle = .fullScreen
                self.present(receiveViewController, animated: true, completion: nil)
                
                // 과외 선택시 상세 페이지 레이블 바뀌기
                if let className = cell?.classNameLabel.text! {
                    print(className)
                    receiveViewController.classLabel.text = className
                    receiveViewController.classHeaderLabel.text = className
                }
                
                // CalendarView 선택된 날짜 가쟈오기
                if let date = calendarCell?.dateLabel.text! {
                    print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
                    // 날짜 선택시 헤더 날짜 레이블 바뀌기
                    dateHeaderLabel.text = date
                    monthHeaderLabel.text = "\(currentMonthIndex+1)월"
                    
                    
                }
                
                // 상세 페이지 과외 시작, 끝, 장소 레이블 업데이트
                if let startHour = cell?.startTimeLabel.text! {
                    //let date = calendarCell?.dateLabel.text!
                    receiveViewController.startTextField.text = "\(currentMonthIndex+1)월 \(dateHeaderLabel.text ?? "")일 \(startHour)"
                }
                
                if let endHour = cell?.endTimeLabel.text! {
                    receiveViewController.endTextField.text = "\(currentMonthIndex+1)월 \(dateHeaderLabel.text ?? "")일 \(endHour)"
                }
                
                if let location = cell?.locationLabel.text! {
                    receiveViewController.locationTextField.text = location
                }
                
                if let imageIcon = cell?.colorImage.image {
                    receiveViewController.classImage.image = imageIcon
                }
                
            }
            
            
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
        
        // 다른 날짜 선택 시 다시 색 원래대로 바뀌기
        // 오늘 날짜일때는 다시 보라색으로 돌아오기
        if indexPath == index {
            cell?.dateView.backgroundColor = UIColor.softBlue
            cell?.dateLabel.textColor = UIColor.white
        } else {
            cell?.dateView.backgroundColor = UIColor.white
            cell?.dateLabel.textColor = UIColor.black
            // 클래스 리스트 한 번 초기화
            classDateList.removeAll()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.dateCollectionView {
            return CGSize(width: collectionView.frame.width/7.5 , height: collectionView.frame.width/7.5 )
        } else {
            return CGSize(width: collectionView.frame.width , height: collectionView.frame.height/1.5 )
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

// Date Extension
extension Date {

    static var calendar: Calendar = {
        return Calendar(identifier: .gregorian)
    }()

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var lastDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    var todaysDate: Int {
        return Calendar.current.component(.month, from: self)
    }

    func isWeekend() -> Bool {
        return Date.calendar.isDateInWeekend(self)
    }
}

