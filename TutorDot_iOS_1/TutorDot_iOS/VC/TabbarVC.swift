//
//  TabbarVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBar.tintColor = UIColor.mainblue
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    
    func setTabBar(){
        
        // Calendar Tab
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let firstTab = calendarStoryboard.instantiateViewController(identifier: "CalendarVC")
            as? CalendarVC  else {
            return
        }
        
        firstTab.tabBarItem.title = "캘린더"
        firstTab.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        firstTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysTemplate)
        print(#function)
        
        
        // Notes Tab
        let notesStoryboard = UIStoryboard.init(name: "Notes", bundle: nil)
        guard let secondTab = notesStoryboard.instantiateViewController(identifier: "NotesVC")
            as? NotesVC  else {
            return
        }

        secondTab.tabBarItem.title = "과외일지"
        secondTab.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysTemplate)

        
        // Alert Tab
        let alertStoryboard = UIStoryboard.init(name: "Alert", bundle: nil)
        guard let thirdTab = alertStoryboard.instantiateViewController(identifier: "AlertVC")
            as? AlertVC  else {
            return
        }

        thirdTab.tabBarItem.title = "알림"
        thirdTab.tabBarItem.image = UIImage.init(systemName: "")
        thirdTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        // MyPage Tab
        let personalInfoStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let fourthTab = personalInfoStoryboard.instantiateViewController(identifier: "MyPageVC")
            as? MyPageVC  else {
            return
        }

        fourthTab.tabBarItem.title = "마이"
        fourthTab.tabBarItem.image = UIImage(named: "")
        fourthTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysTemplate)
        

        
        // Create an Array of Tables with Tabs as Elements.
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab]
//
        // Set the ViewController.
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
