//
//  Product.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import Foundation

struct ProductList: Codable {
    var count: Int
    var data = [Product]()
}

struct Product: Codable {
    var _id: String
    var name: String
    var description: String
}
