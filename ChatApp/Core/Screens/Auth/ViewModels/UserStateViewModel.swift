//
//  UserStateViewModel.swift
//  ChatApp
//
//  Created by Madiapps on 20/11/2022.
//

import Foundation

@MainActor
class UserStateViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    func signUp(email: String, password: String) async -> UserResponse? {
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
    
    func getAllPRODUCT() async {
        do {
            guard let url = URL(string: "http://10.13.104.203:3000/api/v1/admin/get-products") else { fatalError("Missing Url")}
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: request)
            debugPrint(response)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Internal Server Error")}
        }
        catch {
            fatalError("Catch eoor ")
        }
    }
    
    
}
