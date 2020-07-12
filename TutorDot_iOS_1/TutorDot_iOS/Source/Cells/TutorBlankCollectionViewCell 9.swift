//
//  TutorBlankCollectionViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/08.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TutorBlankCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "TutorBlankCollectionViewCell"
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var newClassAddLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
        // Initialization code
    }
    
    func setView() {
        emptyView.backgroundColor = UIColor.clear
        emptyView.layer.borderWidth = 1
        emptyView.layer.borderColor = UIColor.brownishGrey.cgColor
        emptyView.layer.cornerRadius = emptyView.frame.width/20
        newClassAddLabel.textColor = UIColor.brownishGrey
        emptyView.layer.borderColor = UIColor.brownishGreyTransparent.cgColor

        
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> TutorBlankCollectionViewCell {
        let TutorBlankCollectionViewCellIdentifier = "TutorBlankCollectionViewCell"
        
        collectionView.register(UINib(nibName: "TutorBlankCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: TutorBlankCollectionViewCellIdentifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorBlankCollectionViewCellIdentifier, for: indexPath) as! TutorBlankCollectionViewCell
        return cell
    }

}
