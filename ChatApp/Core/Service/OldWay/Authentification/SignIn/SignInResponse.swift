//
//  SignInResponse.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import ObjectMapper

struct SignInResponse: Mappable {

    var error: Bool {
        if message.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var errorString: String
    
    var accessToken: String
    var refreshToken: String
    var message: String
    
    init?(map: Map) {
        //required
        accessToken = ""
        refreshToken = ""
        message = ""
        errorString = ""
    }
    
    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        message <- map["message"]
        errorString <- map["error"]
    }
}

