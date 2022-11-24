//
//  ProductEndPoint.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation
import Alamofire

class ProductsEndPoint: BaseService{
    
    fileprivate static var productRequest: Request? = nil
    
    static func Products(completion: @escaping(_ responseCode: Int?, _ response: [Product]?) -> Void) -> Void {
        
        let path = "/admin/get-products"
        
        productRequest = AF.request(
            "\(url)\(path)",
            method: .get,
            headers: headers
        ).response { response in
            var productsResponse: ProductResponse? = mapTo(response)
            var products = [Product]()
            
            if let productData = productsResponse?.data {
                products = productData.map({ asProduct in
                    return Product(_id: asProduct._id, name: asProduct.name, description: asProduct.description)
                })
            }
            
            completion(response.response?.statusCode, products)
            
        }
    }
    
}

