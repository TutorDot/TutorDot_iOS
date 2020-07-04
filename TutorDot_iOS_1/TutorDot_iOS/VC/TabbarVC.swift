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
        self.tabBar.tintColor = UIColor.white
        setTabBar()
        self.tabBar.frame.size.height = 100
    }
    
    func setTabBar(){
        
        // Calendar Tab
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let firstTab = calendarStoryboard.instantiateViewController(identifier: "CalendarVC")
            as? CalendarVC  else {
            return
        }
        
        // firstTab.tabBarItem.title = "캘린더"
        firstTab.tabBarItem.image = UIImage(named: "tabbarIcCalenderUnpick")?.withRenderingMode(.alwaysOriginal)
        firstTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcCalenderPick")?.withRenderingMode(.alwaysOriginal)
        print(#function)
        
        // Notes Tab
        let notesStoryboard = UIStoryboard.init(name: "Notes", bundle: nil)
        guard let secondTab = notesStoryboard.instantiateViewController(identifier: "NotesVC")
            as? NotesVC  else {
            return
        }

        // secondTab.tabBarItem.title = "과외일지"
        secondTab.tabBarItem.image = UIImage(named: "tabbarIcClassLogUnpick")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcClassLogPick")?.withRenderingMode(.alwaysOriginal)

        // Alert Tab
        let alertStoryboard = UIStoryboard.init(name: "Alert", bundle: nil)
        guard let thirdTab = alertStoryboard.instantiateViewController(identifier: "AlertVC")
            as? AlertVC  else {
            return
        }

        // thirdTab.tabBarItem.title = "알림"
        thirdTab.tabBarItem.image = UIImage(named: "tabbarIcNoticeUnpick")?.withRenderingMode(.alwaysOriginal)
        thirdTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcNoticePick")?.withRenderingMode(.alwaysOriginal)
        
        // MyPage Tab
        let personalInfoStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let fourthTab = personalInfoStoryboard.instantiateViewController(identifier: "MyPageVC")
            as? MyPageVC  else {
            return
        }

        //fourthTab.tabBarItem.title = "마이"
        fourthTab.tabBarItem.image = UIImage(named: "tabbarIcMyUnpick")
        fourthTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcMyPick")?.withRenderingMode(.alwaysOriginal)
        
        // Create an Array of Tables with Tabs as Elements.
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab]
//
        // Set the ViewController.
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 100
        self.tabBar.frame = tabFrame
//        tabbarFrame = self.tabBarController.tabBar.frame
//        tabbarFrame.size.height += 60;
//        self.tabBarController.tabBar.frame = tabbarFrame;
//    }


    }
}
