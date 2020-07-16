//
//  AddLectureService.swift
//  TutorDot_iOS
//
//  Created by 최인정 on 2020/07/16.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import Foundation
import Alamofire

struct AddLectureService{
    //POST : 마이페이지 뷰 수업추가 버튼 클릭 시
    static let shared = AddLectureService()
    
    //request body에 들어갈 부분
    private func makeParameter(_ lectureName: String, _ color: String, _ schedules: [Schedules], _ orgLocation: String, _ bank : String, _ accountNumber : String, _ totalHours: Int, _ price: Int) -> Parameters {
           return ["lectureName": lectureName, "color": color, "schedules": schedules, "orgLocation": orgLocation, "bank": bank, "accountNumber": accountNumber, "totalHours": totalHours, "price": price]
    }
    
    func addLecture(_ token: String, _ lectureName: String, _ color: String, _ schedules: [Schedules], _ orgLocation: String, _ bank : String, _ accountNumber : String, _ totalHours: Int, _ price: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "jwt" : token
        ]
        
        //let dataRequest = Alamofire.request(APIConstants.lectureURL, method: .post, parameters: makeParameter(lectureName, color, schedules, orgLocation, bank, accountNumber, totalHours, price), encoding: JSONEncoding.default, headers: header)
        
        let dataRequest = Alamofire.request(APIConstants.lectureURL, method: .post, parameters: makeParameter(lectureName, color, schedules, orgLocation, bank, accountNumber, totalHours, price), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
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
        case 200: return islectureadd(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func islectureadd(by data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(AddLectureData.self, from: data) else { return .pathErr }
        if decodedData.success {return .success(decodedData.message)}
        else {return .requestErr(decodedData.message)}
        
    }
    
}

struct Schedules: Codable {
    var day: String
    var orgStartTime: String
    var orgEndTime: String

    init(day: String, orgStartTime: String, orgEndTime: String){
        self.day = day
        self.orgStartTime = orgStartTime
        self.orgEndTime = orgEndTime
    }

}
