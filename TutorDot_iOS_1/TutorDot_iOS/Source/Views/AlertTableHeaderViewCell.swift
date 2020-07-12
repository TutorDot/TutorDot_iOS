//
//  AlertTableHeaderViewCell.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 06/07/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class AlertTableHeaderViewCell: UITableViewHeaderFooterView {
    
    static let identifier: String = "AlertTableHeaderViewCell"
    
    let title = UILabel()
    let image = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.backgroundColor = UIColor.paleGrey
        title.font = title.font.withSize(14)
        title.textColor = UIColor.brownishGrey

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.widthAnchor.constraint(equalToConstant: 70),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
            image.heightAnchor.constraint(equalToConstant: 2),
            image.leadingAnchor.constraint(equalTo: title.trailingAnchor,
                                           constant: 20),
            image.trailingAnchor.constraint(equalTo:
                contentView.layoutMarginsGuide.trailingAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

