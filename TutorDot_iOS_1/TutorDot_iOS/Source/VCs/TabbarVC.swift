//
//  TabbarVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    static let identifier:String = "TabbarVC"
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.white
        tabBarSetUp()
        self.tabBar.frame.size.height = 100
        //sizeThatFits(CGSize(width:300,height: 80))
        //viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = self.view.frame.size.height - 100
        self.tabBar.frame = tabFrame
    }

    
    
    
    func tabBarSetUp(){
    
        // Calendar Tab
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let firstTab = calendarStoryboard.instantiateViewController(identifier: "CalendarVC")
            as? CalendarVC  else {
            return
        }
        
        firstTab.tabBarItem.image = UIImage(named: "tabbarIcCalenderUnpick")?.withRenderingMode(.alwaysOriginal)
        firstTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcCalenderPick")?.withRenderingMode(.alwaysOriginal)
        print(#function)
        
        // Notes Tab
        let notesStoryboard = UIStoryboard.init(name: "Notes", bundle: nil)
        guard let secondTab = notesStoryboard.instantiateViewController(identifier: "NotesVC")
            as? NotesVC  else {
            return
        }

        secondTab.tabBarItem.image = UIImage(named: "tabbarIcClassLogUnpick")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcClassLogPick")?.withRenderingMode(.alwaysOriginal)

        // Alert Tab
        let alertStoryboard = UIStoryboard.init(name: "Alert", bundle: nil)
        guard let thirdTab = alertStoryboard.instantiateViewController(identifier: "AlertVC")
            as? AlertVC  else {
            return
        }

        thirdTab.tabBarItem.image = UIImage(named: "tabbarIcNoticeUnpick")?.withRenderingMode(.alwaysOriginal)
        thirdTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcNoticePick")?.withRenderingMode(.alwaysOriginal)
        
        // MyPage Tab
        let personalInfoStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let fourthTab = personalInfoStoryboard.instantiateViewController(identifier: "MyPageVC")
            as? MyPageVC  else {
            return
        }

        fourthTab.tabBarItem.image = UIImage(named: "tabbarIcMyUnpick")
        fourthTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcMyPick")?.withRenderingMode(.alwaysOriginal)
        
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab]

        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab


    }
}
