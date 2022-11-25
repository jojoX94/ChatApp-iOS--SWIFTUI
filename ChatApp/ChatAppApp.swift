//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Madiapps on 17/10/2022.
//

import SwiftUI

@main
struct ChatAppApp: App {
    @State private var isActive = false
    let tabBar = UITabBar.appearance()
    let appearance: UITabBarAppearance = UITabBarAppearance()
    
    
    init() {
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground() // 🔑
        UITabBar.appearance().standardAppearance = transparentAppearence
        UITabBar.appearance().backgroundColor = UIColor(named: "LightBlue")
    }
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
            } else {
                SplashScreen(isActive: $isActive)
            }
        }
    }
}
