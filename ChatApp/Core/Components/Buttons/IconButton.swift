//
//  IconButtonWithBadge.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct IconButton: View {
    
    let width: Int
    let height: Int
    
    let systemName: String
    let badgeCount: Int
    
    let action: () -> Void
    
    init(width: Int = 20, height: Int = 20 , systemName: String, badgeCount: Int = 0, action: @escaping () -> Void) {
        self.width = width
        self.height = height
        self.systemName = systemName
        self.badgeCount = badgeCount
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .frame(width: CGFloat(width), height: CGFloat(height))
                .foregroundColor(.black)
                .overlay(alignment: .topTrailing) {
                    if badgeCount != 0 {
                        Text("\(badgeCount)")
                            .font(.custom("Poppins-SemiBold", size: 10))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .foregroundColor(.red)
                            )
                            .offset(x: 8, y: 8)
                    }
                }
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(systemName: "phone") {}
    }
}
