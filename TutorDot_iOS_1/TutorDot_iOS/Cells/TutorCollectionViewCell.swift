//
//  TutorCollectionViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 02/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TutorCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "TutorCollectionViewCell"
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var classHourLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var colorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        infoView.layer.cornerRadius = infoView.frame.width/20
        backgroundColor = UIColor.paleGrey
        classNameLabel.text = "류세화 튜티 수학 수업"
        classHourLabel.textColor = UIColor.brownishGrey
        locationLabel.textColor = UIColor.brownishGrey
        startTimeLabel.textColor = UIColor.brownishGrey
        endTimeLabel.textColor = UIColor.brownishGrey
        
    }

    
    func set(_ classInformation: CalendarCell) {
        startTimeLabel.text = classInformation.startTimeLabel
        endTimeLabel.text = classInformation.endTimeLabel
        classNameLabel.text = classInformation.classNameLabel
        classHourLabel.text = classInformation.classHourLabel
        locationLabel.text = classInformation.locationLabel
        //colorImage.image = UIImage(classInformation.colorImage)
    }
    
    
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> TutorCollectionViewCell {
        let TutorCollectionViewCellIdentifier = "TutorCollectionViewCellIdentifier"
        
        collectionView.register(UINib(nibName: "TutorCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: TutorCollectionViewCellIdentifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorCollectionViewCellIdentifier, for: indexPath) as! TutorCollectionViewCell
        return cell
    }

}
