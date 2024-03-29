//
//  UserStateViewModel.swift
//  ChatApp
//
//  Created by Madiapps on 20/11/2022.
//

import Foundation
import Combine

@MainActor
class UserStateViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init(dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
        isLoggedIn = verifyIfUserLoggeIn()
    }
    
    fileprivate func verifyIfUserLoggeIn() -> Bool {
        let keychain = UserDefaults.standard
        let pusherId = keychain.string(forKey: Defaults.pushUserId)
        
//        let keychain = KeychainWrapper.standard
//        let pusherId = keychain.string(forKey: Defaults.pushUserId)
        
//        if UserDefaults.standard.bool(forKey: Defaults.firstTimeLaunchOccurred) {
//            KeychainWrapper.standard.removeAllKeys()
//            UserDefaults.standard.set(false, forKey: Defaults.firstTimeLaunchOccurred)
//        }
        
        if let pusherId = pusherId, !pusherId.isEmpty {
            return true
        } else {
            #if targetEnvironment(simulator)
            keychain.set( UUID().uuidString, forKey: Defaults.pushUserId)
            #else
            keychain.set(UIDevice.current.identifierForVendor!.uuidString, forKey: Defaults.pushUserId)
            #endif
            return false
        }
    }
    
    func signUp_v2(name: String, email: String, password: String) async -> Void {
        dataManager
            .registerUser(name: name, email: email, password: password)
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    
                } else {
                    
                }
            }.store(in: &cancellableSet)
    }
    
    func login_v1(email: String, password: String,  _ completion: @escaping(_ responseCode: Int?, _ response: SignInResponse?) -> Void) async -> Void {
        AppService.loginUser(email: email, password: password) { responseCode, response in
            completion(responseCode, response)
        }
    }
    
    
    func signUp_v1(name: String, email: String, password: String) async -> Void {
        await AppService.registerUser(name: name, email: email, password: password) { responseCode, response in
            
        }
    }
    
    func signUp_v0(email: String, password: String) async -> UserResponse? {
        isBusy = true
        do{
            guard let url = URL(string: "http://10.13.104.203:3000/api/v1/signup") else { fatalError("Missing Url")}
            let body: [String:String] = ["name": "name", "email": email, "password": password]
            let finalBody = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Internal Server Error")}
            let decodedUrlResonse = try JSONDecoder().decode(UserResponse.self, from: data)
            isLoggedIn = true
            isBusy = false
            debugPrint("Success on call API FakeEcommerce")
            return decodedUrlResonse
        }catch{
            isBusy = false
           debugPrint("Error on call API FakeEcommerce")
        }
        return nil
    }
        
    
}
