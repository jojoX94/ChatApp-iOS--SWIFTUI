//
//  ASProduct.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import ObjectMapper

struct ASProduct: Mappable {
    
    var _id: String
    var name: String
    var description: String
    
    init?(map: ObjectMapper.Map) {
        _id = ""
        name = ""
        description = ""
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        name <- map["name"]
        _id <- map["_id"]
        description <- map["description"]
    }
}
