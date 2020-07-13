//
//  SignUpService.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/12.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService() // 싱글톤 객체
    private func makeParameter(_ userName: String, _ email: String, _ password: String, _ role: String) -> Parameters { return ["userName": userName, "email": email, "password": password, "role": role]
    }
    
    func signup(userName: String, email: String, password: String, role: String, completion: @escaping (NetworkResult<Any>) -> Void) {

                  let header: HTTPHeaders = ["Content-Type": "application/json"]
                        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(userName, email, password, role), encoding: JSONEncoding.default, headers: header)
        
                        dataRequest.responseData { dataResponse in switch dataResponse.result {
                        case .success:
                                guard let statusCode = dataResponse.response?.statusCode else { return }
                                guard let value = dataResponse.result.value else { return }
                                let networkResult = self.judge(by: statusCode, value)
                                completion(networkResult)
                        case .failure: completion(.networkFail)
                            }
                    }
            }

    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
    case 200: return isSignedUp(by: data)
    case 400: return .pathErr
    case 500: return .serverErr
    default: return .networkFail
        }
        
    }
    
    
    private func isSignedUp(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpData.self, from: data) else { return .pathErr }
        
        if decodedData.success {return .success(data)}
        else {return .requestErr(decodedData.message)}
        
    }
    
}
