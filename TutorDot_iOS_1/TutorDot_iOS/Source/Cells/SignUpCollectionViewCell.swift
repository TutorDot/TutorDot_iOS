//
//  SignUpCollectionViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/09.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class SignUpCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SignUpCollectionViewCell"

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var tutorLabel1: UILabel!
    @IBOutlet weak var tutorLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }
    
    func setUpView() {
        tutorLabel1.textColor = UIColor.veryLightPink
        
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> SignUpCollectionViewCell {
           let SignUpCollectionViewCellIdentifier = "SignUpCollectionViewCell"
           
           collectionView.register(UINib(nibName: "SignUpCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: SignUpCollectionViewCellIdentifier)
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpCollectionViewCellIdentifier, for: indexPath) as! SignUpCollectionViewCell
           return cell
       }

}


