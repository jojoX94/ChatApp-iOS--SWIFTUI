//
//  ContentMessageView.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct ContentMessageView: View {
    
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .font(.custom("Poppins-SemiBold", size: 10))
            .foregroundColor(.black)
            .padding(.vertical, 13)
            .padding(.horizontal, 26)
            .background {
                Rectangle()
                    .foregroundColor( isCurrentUser ? Color(hex: "#A1D2FB") : Color(hex: "#E3E1E1") )
            }
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "It's fine no problemo", isCurrentUser: false)
    }
}
