//
//  ProductViewModel.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation

struct Producct {
    var _id: String
    var name: String
    var description: String
    var images: [String:String]
    var quantity: Int
    var price: Int
    var category: String
    var ratings = [Rating]()
}


struct Rating {
    var _id: String
    var rating: Int
    var userId: String
}
