//
//  ProfileService.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/14.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

struct ProfileService {
    static let shared = ProfileService()
    
    func setMyProfile(_ token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "jwt" : token
        ]
    
        let dataRequest = Alamofire.request(APIConstants.profileURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                print("setMyProfile success")
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    private func judge(by StatusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch StatusCode {
        case 200 :
            print("judge 200")
            return isLookup(by: data)
        case 400 :
            return .pathErr
        case 500 :
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isLookup(by data: Data) -> NetworkResult<Any> {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(ProfileData.self, from: data)
            print(decodedData)
            return .success(decodedData.data)
        }
        catch {
            print(error)
            return .pathErr
        }
    }
}

