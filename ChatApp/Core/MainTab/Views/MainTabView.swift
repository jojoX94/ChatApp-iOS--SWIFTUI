//
//  MainTabView.swift
//  ChatApp
//
//  Created by Madiapps on 02/11/2022.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: PROPERTY
    
    @StateObject var viewRouter = ViewRouter()
    
    // MARK: BODY
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                mainScreen()
                
                if !viewRouter.tabBarHidden {
                    customTabView(geometry: geometry)
                }

            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

// MARK: COMPONENTS

extension MainTabView {
    private func mainScreen() -> some View {
        Group {
            switch viewRouter.currentPage {
                case .home:
                    FeedScreen()
                case .messages:
                    MessageScreen()
                        .environmentObject(viewRouter)
                case .profile:
                    ProfileScreen()
                case .notifications:
                   SignUpScreen()
            }
        }
    }
    
    private func customTabView(geometry: GeometryProxy) -> some View {
        
        return VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, iconName: "HomeIconTab")
                
                Spacer()
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: .messages, iconName: "MessageIconTab")
                
                
                ZStack {
                    Circle()
                        .foregroundColor(.white.opacity(0.3))
                        .frame(width: geometry.size.width/4, height: geometry.size.width/4)
                        .shadow(radius: 4)
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                    Image("PlusIconTab")
                }
                .offset(y: -geometry.size.height/11/2)
                
                
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, iconName: "ProfileIconTab")
                
                Spacer()
                
                TabBarIcon(viewRouter: viewRouter, assignedPage: .notifications, iconName: "NotificationIconTab")
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height/10)
            .background(Color("LightBlue"))
        }
    }
}
