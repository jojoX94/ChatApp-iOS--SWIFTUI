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
import Combine

@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var products = [Product]()
    @Published var isLoading = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init( dataManager: ServiceProtocol = Service.shared, products: [Product] = [Product]()) {
        self.dataManager = dataManager
        getProducts_v2()
//        getProducts_v1()
    }
    
    func getProducts_v2() {
        dataManager
            .fetchProducts()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    
                } else {
                    self.products = dataResponse.value!.data
                    debugPrint(self.products)
                }
            }.store(in: &cancellableSet)
    }
    
    func getProducts_v1() -> Void{
        isLoading = true
        AppService.Products { [weak self] responseCode, response in
            self?.isLoading = false
            
            if let response = response {
                self?.products = response
            }
            
        }
    }
    
}
