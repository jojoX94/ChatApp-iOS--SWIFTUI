//
//  UserResponse.swift
//  ChatApp
//
//  Created by Madiapps on 20/11/2022.
//

import Foundation

struct UserResponse:Decodable {
    var _id: String
    var name: String
    var email: String
    var password: String
    var address: String
    var type: String
}
