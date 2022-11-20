//
//  MessageRowView.swift
//  ChatApp
//
//  Created by Madiapps on 08/11/2022.
//

import SwiftUI

struct MessageRowView: View {
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 41, height: 41)
                    .foregroundColor(.brown)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color(hex: "#5DD33F"))
                            .offset(x: -4, y: 0)
                    }
                
                VStack(alignment: .leading) {
                    Text("Juan Risma")
                        .font(.custom("Poppins-SemiBold", size: 13))
                    
                    HStack(spacing: 20) {
                        Text("How r u doing")
                            .font(.custom("Poppins-SemiBold", size: 10))
                        
                        Text("Wed")
                            .font(.custom("Poppins-SemiBold", size: 9))
                            .foregroundColor(.black.opacity(0.31))
                    }
                }
                
            }
            
            Spacer()
            
            Circle()
                .frame(width: 6, height: 6)
                .foregroundColor(.blue)
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView()
    }
}
