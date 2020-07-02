//
//  CalendarVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

protocol CalendarViewControllerDeleagte {
    func didSelectDate(dateString: String)
}

class CalendarVC: UIViewController {

    @IBOutlet weak var topDateButton: UIButton!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerUI()
        setupCalendar()

        // Do any additional setup after loading the view.
    }
    


}

extension CalendarVC {
    func setupViewControllerUI() {
        dateCollectionView.delegate = self
        dateCollectionView.dataSource = self
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
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex+1)-01".date?.firstDayOfTheMonth.weekday)!
        return day
    }
}


extension CalendarVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = numOfDaysInMonth[currentMonthIndex] + firstWeekDayOfMonth - 1
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CalendarCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
            return cell
            
        } else {
            let calcDate = indexPath.row-firstWeekDayOfMonth+2
            cell.isHidden = false
            cell.dateLabel.textColor = UIColor.black
            cell.dateLabel.text="\(calcDate)"
            cell.dateLabel.textColor = UIColor.black
            cell.isUserInteractionEnabled = true
            cell.backgroundColor = UIColor.white
            //cell.backgroundImageView.isHidden = true
            
            // If you want to disable the previous dates of current month
            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                //cell.isUserInteractionEnabled=false
                
            } else {
                //cell.isUserInteractionEnabled=true
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CalendarCollectionViewCell
        
        if let date = cell?.dateLabel.text! {
            print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
            
            // If you want to pass the selected date to previous viewController, use following delegate
            self.delegate?.didSelectDate(dateString: "\(currentYear)-\(currentMonthIndex+1)-\(date)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/7 , height: collectionView.frame.width/7 )
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

    func isWeekend() -> Bool {
        return Date.calendar.isDateInWeekend(self)
    }
}

// String Extension

extension String {
    
    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
           let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
           return String(String.UnicodeScalarView(passed))
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return predicate.evaluate(with: self)
    }
    
    func validatePasswd() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return predicate.evaluate(with: self)
    }
}

extension String {

    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var date: Date? {
        return String.dateFormatter.date(from: self)
    }

    var length: Int {
        return self.count
    }
}
