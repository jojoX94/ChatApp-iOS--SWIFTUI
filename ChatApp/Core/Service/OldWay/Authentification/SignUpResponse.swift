//
//  SignUpResponse.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import ObjectMapper

struct SignUpResponse: Mappable {

    var errorStatus: Bool {
        if message.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var statusCode: String
    var message: String
    var error: String
    
    init?(map: Map) {
        statusCode = ""
        message = ""
        error = ""
    }
    
    mutating func mapping(map: Map) {
        statusCode <- map["statusCode"]
        message <- map["message"]
        error <- map["error"]
    }
    
}
