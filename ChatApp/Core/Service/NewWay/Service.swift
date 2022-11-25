//
//  Service.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    
    //MARK: AUTHENTIFICATION
    
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<DataResponse<SignUpRes, NetworkError>, Never>
    
    //MARK: PRODUCTS
    
    func fetchProducts() -> AnyPublisher<DataResponse<ProductList, NetworkError>, Never>
    
}

class Service {
    static let shared: ServiceProtocol = Service()
    private init() { }
}


