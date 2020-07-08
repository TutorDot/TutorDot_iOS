//
//  JournalDateHeaderView.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/07.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class JournalDateHeaderView: UIView {

    lazy var dateHeaderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 16)
        view.backgroundColor =  UIColor(red: 245 / 255, green: 246 / 255, blue: 250 / 255, alpha: 1.0)
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 65, height: 16)
        label.text = "7월 10일"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 112 / 255, green: 112 / 255, blue: 112 / 255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()

    lazy var lineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 285, height: 1.5)
        view.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1.0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setUpView()
    }
    
    func setUpView(){
        self.addSubview(self.dateHeaderView)
        self.dateHeaderView.addSubview(self.dateLabel)
        self.dateHeaderView.addSubview(self.lineView)

        setDateHeaderViewConstraints()
        setdateLabelConstraints()
        setlineViewConstraints()
    }
}

extension JournalDateHeaderView {
    func setDateHeaderViewConstraints(){
        self.dateHeaderView.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.dateHeaderView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.dateHeaderView,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        
        let constraintTop = NSLayoutConstraint(item: self.dateHeaderView,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0)
        
        let constraintButtom = NSLayoutConstraint(item: self.dateHeaderView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .bottom,
                                                    multiplier: 1.0,
                                                    constant: 0)
        
        let constraintHeight = NSLayoutConstraint(item: self.dateHeaderView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: .none,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 0,
                                                   constant: 16)
        NSLayoutConstraint.activate([constraintLeading, constraintTrailing, constraintTop, constraintButtom, constraintHeight])
    }
    
    func setdateLabelConstraints(){
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.dateLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 20)
               
        let constraintTop = NSLayoutConstraint(item: self.dateLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)
        let constraintHeight = NSLayoutConstraint(item: self.dateLabel,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: .none,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 0,
                                                  constant: 16)
        NSLayoutConstraint.activate([constraintLeading, constraintTop, constraintHeight])
    }
    
    func setlineViewConstraints(){
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.lineView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 90)
        let constrainTrailing = NSLayoutConstraint(item: self.lineView,
                                                    attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTop = NSLayoutConstraint(item: self.lineView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 8)
        let constraintHeight = NSLayoutConstraint(item: self.lineView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: .none,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 0,
                                                  constant: 1.5)
        NSLayoutConstraint.activate([constraintLeading, constrainTrailing, constraintTop, constraintHeight])
    }

}
