//
//  CustomStructures.swift
//  ChatApp
//
//  Created by Madiapps on 20/10/2022.
//

import Foundation

@propertyWrapper struct AllLowerCase {
    
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.lowercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.lowercased()
    }
    
}

@propertyWrapper struct Capitalized {
    
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
    
}
