//
//  TabBarIcon.swift
//  ChatApp
//
//  Created by Madiapps on 03/11/2022.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let assignedPage: Page
    let iconName: String
    
    
    var body: some View {
        VStack(spacing: 4) {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 21, height: 3)
                .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .clear)
        }
        .onTapGesture {
            withAnimation {
                viewRouter.currentPage = assignedPage                
            }
        }
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIcon(viewRouter: ViewRouter(), assignedPage: .home, iconName: "HomeIconTab")
    }
}
