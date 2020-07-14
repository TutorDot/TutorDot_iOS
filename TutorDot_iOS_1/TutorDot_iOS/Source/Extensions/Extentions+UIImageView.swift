//
//  Extentions+UIImageView.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/14.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        // URL이 들어오는 것을 Cache 키로 사용
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil) { result in
            switch result {
            case .success(let value):
                completion(value.image)
            case .failure(let err):
                print(err.errorCode)
                completion(nil)
            }
        }
    }
}
