//
//  BaseService.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation
import Alamofire
import ObjectMapper

let url = Defaults.apiURL

class BaseService {
    static func mapTo<T: Mappable>(_ responseData: AFDataResponse<Data?>) -> T? {
        var response: T? = nil
        
        if let body = responseData.request?.httpBody {
            debugPrint(String(data: body, encoding: .utf8) ?? "")
        }
        
        if let data = responseData.data {

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                if let json = json {
                    response = Mapper<T>().map(JSON: json)
                }
                
            } catch {
                print("errorMsg")
            }
            
        }
        
        return response
    }
    
    static var headers: HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: Defaults.accessToken)
        
        if let token = token {
            
            let _headers: HTTPHeaders = [
                .accept("*/*"),
                .contentType("application/json"),
                .authorization(bearerToken: token)
            ]
            
            return _headers
        } else {
            return [
                .accept("*/*"),
                .contentType("application/json")
            ]
        }
    }
    
    
}
