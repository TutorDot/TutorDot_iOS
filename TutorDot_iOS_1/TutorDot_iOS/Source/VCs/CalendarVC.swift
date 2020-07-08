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
    
    static let identifier:String = "CalendarVC"

    @IBOutlet weak var topDateButton: UIButton!
    @IBOutlet weak var dateCollectionView:
        UICollectionView!
    
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownLabelButton: UIButton!
    var dropDown:DropDown?
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var classList : [Tutor] = []
    var calendarDotList : [CalendarDot] = []
    
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
        
        //dropDown?.cellNib = UINib(nibName: "DropDownDetailCell", bundle: nil)
        //dropDown?.customCellConfiguration = { (index: Index, item: String, cell: DropDownDetailCell) -> Void in guard let cell = cell as? DropDownDetailCell else { return }} as? CellConfigurationClosure
       
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
    }
    
    @objc func dropDownToggleButton(){
        dropDown?.show()
    }
    
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
    
    @IBOutlet weak var tutorCollectionView: UICollectionView!
    @IBOutlet weak var dateHeaderLabel: UILabel!
    @IBOutlet weak var monthHeaderLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    // 변수 설정
    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var delegate: CalendarViewControllerDeleagte?
    

    
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
        let info1 = Tutor(startTime: "3:00pm", endTime: "5:00pm", className: "류세화님의 수학과외", classHour: "6회차, 3시간", locationLabel: "강남역", colorImage: "myClassTapEditImgYellow", colorImage2: "", colorImage3: "")
        let info2 = Tutor(startTime: "6:00pm", endTime: "9:00pm", className: "최인정님의 수학과외", classHour: "3회차, 2시간", locationLabel: "강남구청역", colorImage: "myClassTapEditImgRed", colorImage2: "", colorImage3: "")
        
        classList = [info1, info2]
    }
    
    func setCalendarDot() {
        let info1 = CalendarDot(image1: "myClassTapEditImgYellow", image2: "myClassTapEditImgRed", image3: "")
        let info2 = CalendarDot(image1: "myClassTapEditImgRed", image2: "myClassTapEditImgRed", image3: "")
        
        calendarDotList = [info1, info2]
    }
    

    


}

extension CalendarVC {
    func setupViewControllerUI() {
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
        tutorCollectionView.delegate = self
        tutorCollectionView.dataSource = self
        //topView.backgroundColor = UIColor.white
    }
    
    func setupCalendar() {
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentMonthIndex -= 1 // bcz apple calendar returns months starting from 1
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        firstWeekDayOfMonth = getFirstWeekDay()
        
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
}


extension CalendarVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.dateCollectionView {
            let count = numOfDaysInMonth[currentMonthIndex] + firstWeekDayOfMonth - 1
            return count
        } else {
            return classList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendarCell = CalendarCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        let tutorInfoCell = TutorCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        
        // CalendarCollectionView
        if collectionView == self.dateCollectionView {
            // 다음 달로 넘어가면 선택한 날짜 색 초기화
            calendarCell.dateView.backgroundColor = UIColor.white
            //calendarCell.set(calendarDotList[indexPath.row])
            if indexPath.item <= firstWeekDayOfMonth - 2 {
                calendarCell.isHidden = true
                return calendarCell
            } else {
                let calcDate = indexPath.row-firstWeekDayOfMonth+2
                calendarCell.isHidden = false
                calendarCell.dateLabel.textColor = UIColor.black
                calendarCell.dateLabel.text="\(calcDate)"
                calendarCell.dateLabel.textColor = UIColor.black
                calendarCell.isUserInteractionEnabled = true
                calendarCell.backgroundColor = UIColor.white
                //cell.backgroundImageView.isHidden = true
                
            }
            return calendarCell
        }
        // TutorCollectionView
        else {
            tutorInfoCell.infoView.frame.size.width = tutorInfoCell.frame.size.width/2
            tutorInfoCell.set(classList[indexPath.row])
            
            return tutorInfoCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.dateCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
            
            // 날짜 선택시 셀 색깔 바뀌기
            cell?.dateView.backgroundColor = UIColor.softBlue
            cell?.dateLabel.textColor = UIColor.white
            
            if let date = cell?.dateLabel.text! {
                print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
                // 날짜 선택시 헤더 날짜 레이블 바뀌기
                dateHeaderLabel.text = date
                monthHeaderLabel.text = "\(currentMonthIndex+1)월"
                
                // If you want to pass the selected date to previous viewController, use following delegate
                self.delegate?.didSelectDate(dateString: "\(currentYear)-\(currentMonthIndex+1)-\(date)")
            }
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as? TutorCollectionViewCell
            let calendarCell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
            
            guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: ClassEditVC.identifier) as? ClassEditVC else {return}
            
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
                
                
                // If you want to pass the selected date to previous viewController, use following delegate
                self.delegate?.didSelectDate(dateString: "\(currentYear)-\(currentMonthIndex+1)-\(date)")
                
                
            }
            
            // 상세 페이지 과외 시작, 끝, 장소 레이블 업데이트
            if let startHour = cell?.startTimeLabel.text! {
                //let date = calendarCell?.dateLabel.text!
                receiveViewController.startTextField.text = "\(currentMonthIndex+1)월 \(startHour)"
                
            
            }
            
            if let endHour = cell?.endTimeLabel.text! {
                receiveViewController.endTextField.text = "\(currentMonthIndex+1)월 \(endHour)"
            }
            
            if let location = cell?.locationLabel.text! {
                receiveViewController.locationTextField.text = location
            }
            
            if let imageIcon = cell?.colorImage.image {
                receiveViewController.classImage.image = imageIcon
            }
            
            

    
            }

        }
        
        

    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
    
        // 다른 날짜 선택 시 다시 색 원래대로 바뀌기
        cell?.dateView.backgroundColor = UIColor.white
        cell?.dateLabel.textColor = UIColor.black
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.dateCollectionView {
            return CGSize(width: collectionView.frame.width/7 , height: collectionView.frame.width/7 )
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
    
    var todaysDate: Int {
        return Calendar.current.component(.month, from: self)
    }

    func isWeekend() -> Bool {
        return Date.calendar.isDateInWeekend(self)
    }
}
