//
//  Message.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var content: String
    var user: User
}

struct User {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
