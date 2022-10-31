//
//  CustomIcon.swift
//  ChatApp
//
//  Created by Madiapps on 20/10/2022.
//

import SwiftUI

struct CustomIcon: View {
    
    var systemeName: String
    var count: String?
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: systemeName)
                .frame(width: 24, height: 24)
            
            if let count = count {
                Text(count)
                    .font(.custom("Poppins-SemiBold", size: 17))           
            }
        }
        .foregroundColor(.white.opacity(0.8))
    }
}

struct CustomIcon_Previews: PreviewProvider {
    static var previews: some View {
        CustomIcon(systemeName: "ellipsis.message.fill", count: "6")
    }
}
