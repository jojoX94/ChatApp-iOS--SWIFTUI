//
//  NetworkError.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import Alamofire
import Foundation

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}

