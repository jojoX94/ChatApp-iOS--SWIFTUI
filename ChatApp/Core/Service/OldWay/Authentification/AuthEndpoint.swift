//
//  AuthEndpoint.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation
import Alamofire

class AuthEndpoint: BaseService{
    
    fileprivate static var registerRequest: Request? = nil
    fileprivate static var loginRequest: Request? = nil
    
    static func registerUser(name: String, email: String, password: String, _ completion: @escaping(_ responseCode: Int?, _ response: SignUpResponse?) -> Void) {
        
        let path = "/signup"
        
        let signUpBody = SignUpBody(name: name, email: email, password: password)
        
        registerRequest = AF.request(
            "\(url)\(path)",
            method: .post,
            parameters: signUpBody,
            encoder: JSONParameterEncoder.default,
            headers: headers
        ).response { response in
            var signUpResponse: SignUpResponse? = nil
            
            if let data = response.data {
                
                let responseString = String(data: data, encoding: .utf8)
                
                
                if let responseString = responseString {
                    signUpResponse = SignUpResponse(JSONString: responseString)
                    
                    if let signUpResponse = signUpResponse {
                        debugPrint(signUpResponse)
                    }
                }
            }
            
            completion(response.response?.statusCode, signUpResponse)
            
        }
        
    }
    
    
    static func loginUser( email: String, password: String, _ completion: @escaping(_ responseCode: Int?, _ response: SignInResponse?) -> Void) {
        
        let path = "/signin"
        
        let signInBody = SignInBody(email: email, password: password)
        
        registerRequest = AF.request(
            "\(url)\(path)",
            method: .post,
            parameters: signInBody,
            encoder: JSONParameterEncoder.default,
            headers: headers
        ).response { response in
            var signInResponse: SignInResponse? = nil
            
            if let data = response.data {
                
                let responseString = String(data: data, encoding: .utf8)
                
                
                if let responseString = responseString {
                    signInResponse = SignInResponse(JSONString: responseString)
                    
                    if let signInResponse = signInResponse {
                        debugPrint(signInResponse)
                    }
                }
            }
            
            completion(response.response?.statusCode, signInResponse)
            
        }
        
    }
}
