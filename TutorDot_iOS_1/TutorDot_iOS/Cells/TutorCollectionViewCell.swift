//
//  TutorCollectionViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 02/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TutorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var classHourLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        infoView.layer.cornerRadius = infoView.frame.width/20
        backgroundColor = UIColor.paleGrey
    }
    
    
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> TutorCollectionViewCell {
        let TutorCollectionViewCellIdentifier = "TutorCollectionViewCellIdentifier"
        
        collectionView.register(UINib(nibName: "TutorCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: TutorCollectionViewCellIdentifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorCollectionViewCellIdentifier, for: indexPath) as! TutorCollectionViewCell
        return cell
    }

}
