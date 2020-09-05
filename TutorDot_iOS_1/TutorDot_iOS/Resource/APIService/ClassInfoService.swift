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
        //let header: HTTPHeaders = ["jwt": UserDefaults.standard.object(forKey: "token") as? String ?? " "]
        
        let header: HTTPHeaders = ["jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc2LCJuYW1lIjoic2Vod2EiLCJpYXQiOjE1OTkyOTE1NjAsImV4cCI6MTYwMDUwMTE2MCwiaXNzIjoib3VyLXNvcHQifQ.d-r6t4qlMjIi9sY8T9S84emHtWTjuxktHHlJESefKXE"]
        
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
    
    // POST: 캘린더 플러스 버튼 눌렀을 때 일정 추가하기
    private func makeParameter(_ lectureId: Int, _ date: String, _ startTime: String, _ endTime: String, _ location: String ) -> Parameters{
        return ["lectureId": lectureId, "date": date, "startTime": startTime, "endTime": endTime, "location": location]
    }
    
    func addClassSchedule(lectureId:Int, date: String, startTime: String, endTime: String, location: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        // 토큰 가져오기
        //let header: HTTPHeaders = ["jwt": UserDefaults.standard.object(forKey: "token") as? String ?? " "]
        
        let header: HTTPHeaders = ["jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc2LCJuYW1lIjoic2Vod2EiLCJpYXQiOjE1OTkyOTE1NjAsImV4cCI6MTYwMDUwMTE2MCwiaXNzIjoib3VyLXNvcHQifQ.d-r6t4qlMjIi9sY8T9S84emHtWTjuxktHHlJESefKXE"]
        
        let dataRequest = Alamofire.request(APIConstants.calendarClassURL, method: .post, parameters: makeParameter(lectureId, date, startTime, endTime, location), headers: header)
        
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
