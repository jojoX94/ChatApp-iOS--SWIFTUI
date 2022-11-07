//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Madiapps on 17/10/2022.
//

import SwiftUI

@main
struct ChatAppApp: App {
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
            ContentView()
        }
    }
}
