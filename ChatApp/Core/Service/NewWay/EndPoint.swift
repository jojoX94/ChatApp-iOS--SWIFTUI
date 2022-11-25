//
//  SignUpEndpoint.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import Foundation
import Combine

extension Service: ServiceProtocol {
    
    func registerUser(name: String, email: String, password: String) -> AnyPublisher<Alamofire.DataResponse<SignUpRes, NetworkError>, Never> {
        
        let url = URL(string: Defaults.apiURL + "/signup")!
        
        let signUpBody = SignUpBody(name: name, email: email, password: password)
        
        return AF.request(url, method: .post, parameters: signUpBody, encoder: JSONParameterEncoder.default, headers: BaseService.headers)
            .validate()
            .publishDecodable(type: SignUpRes.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func fetchProducts() -> AnyPublisher<DataResponse<ProductList, NetworkError>, Never> {
        let url = URL(string: Defaults.apiURL + "/admin/get-products")!
        
        return AF.request(url,
                          method: .get,
                          headers: BaseService.headers
                          )
            .validate()
            .publishDecodable(type: ProductList.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
