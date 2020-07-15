//
//  ClassInfoService.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 2020/07/13.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

// 수업 정보 가져오는 서비스 파일
struct ClassInfoService {
    // Singleton
    static let classInfoServiceShared = ClassInfoService()
    
    
    // GET: 캘린더 탭 했을 때 전체 수업 정보 가져오기
    func getAllClassInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        // 토큰 가져오기
        let header: HTTPHeaders = ["jwt": UserDefaults.standard.object(forKey: "token") as? String ?? " "]
        
        //let header: HTTPHeaders = ["jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjU4LCJuYW1lIjoic2Vod2EiLCJpYXQiOjE1OTQ4MzQwNzYsImV4cCI6MTU5NjA0MzY3NiwiaXNzIjoib3VyLXNvcHQifQ.gYYrGNODEgwRHQTJfxmjMjC0VaIa-Ht4zz8c712hLEs"]
        
        let dataRequest = Alamofire.request(APIConstants.calendarURL, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    // GET: 특정 수업 일정 조회
    func getOneClassInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        let dataRequest = Alamofire.request(APIConstants.calendarLidURL)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        //case 200: return isClassData(by: data)
        case 200:
            print("judge success")
            return isClassData(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isClassData(by data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ClassData.self, from: data)
            else {return .pathErr}
        print(decodedData.status, "\n", decodedData.success, "\n", decodedData.message, "\n")
        
        if decodedData.success {
            //print(decodedData.data)
            return .success(decodedData.data)
        }
        else {
            return .requestErr(decodedData.message)}
    }
    
    
}
