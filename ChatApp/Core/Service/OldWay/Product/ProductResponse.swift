//
//  ProductResponse.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import ObjectMapper

struct ProductResponse: Mappable {
    
    var count: Int
    var data = [ASProduct]()
    
    init?(map: Map) {
        count = 0
        data =  [ASProduct]()
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        data <- map["data"]
    }
}
