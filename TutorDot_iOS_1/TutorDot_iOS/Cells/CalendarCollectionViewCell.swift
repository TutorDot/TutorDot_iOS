//
//  CalendarCollectionViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 02/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateView.layer.cornerRadius = dateView.frame.width/1.5
        dateView.clipsToBounds = true
        dateView.backgroundColor = UIColor.white
        //backgroundColor = UIColor.black
        
    }
    
    // XIB 연결해주기
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> CalendarCollectionViewCell {
        let CalendarCollectionViewCellIdentifier = "CalendarCollectionViewCellIdentifier"
        
        collectionView.register(UINib(nibName: "CalendarCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: CalendarCollectionViewCellIdentifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCellIdentifier, for: indexPath) as! CalendarCollectionViewCell
        return cell
    }
    
    

}
