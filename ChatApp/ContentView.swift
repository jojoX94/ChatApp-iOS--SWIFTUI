//
//  ContentView.swift
//  ChatApp
//
//  Created by Madiapps on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userViewModel = UserStateViewModel()
    
    var body: some View {
        Group {
            if userViewModel.isLoggedIn {
                MainTabView()
                    
            } else {
                LoginScreen()
            }
        }
        .environmentObject(userViewModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
