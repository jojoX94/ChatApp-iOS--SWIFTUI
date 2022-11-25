//
//  AppService.swift
//  ChatApp
//
//  Created by Madiapps on 24/11/2022.
//

import Foundation

class AppService {
    
    //MARK: AuthEndpoint
    
    static func registerUser(name: String, email: String, password: String, _ completion: @escaping(_ responseCode: Int?, _ response: SignUpResponse?) -> Void) {
        AuthEndpoint.registerUser(name: name, email: email, password: password, completion)
    }
    
    static func loginUser( email: String, password: String, _ completion: @escaping(_ responseCode: Int?, _ response: SignInResponse?) -> Void) {
        AuthEndpoint.loginUser(email: email, password: password, completion)
    }
    
    //MARK: Products
    
    static func Products(completion: @escaping(_ responseCode: Int?, _ response: [Product]?) -> Void) -> Void {
        ProductsEndPoint.Products(completion: completion)
    }
    
//    static func OldVersion_Products(_ completion: @escaping (_ statusCode: Int?, _ products: [Producct]?) ) -> Void {
//        
//    }
}
