//
//  ProductViewModel.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation

//struct Producct {
//    var _id: String
//    var name: String
//    var description: String
//    var images: [String:String]
//    var quantity: Int
//    var price: Int
//    var category: String
//    var ratings = [Rating]()
//}
//
//
//struct Rating {
//    var _id: String
//    var rating: Int
//    var userId: String
//}


import Foundation
import UIKit

@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var products = [Product]()
    @Published var isLoading = false
    
    init(products: [Product] = [Product]()) {
        getProducts()
    }
    
    func getProducts() -> Void{
        isLoading = true
        AppService.Products { [weak self] responseCode, response in
            self?.isLoading = false
            
            if let response = response {
                self?.products = response
            }
            
        }
    }
    
}
