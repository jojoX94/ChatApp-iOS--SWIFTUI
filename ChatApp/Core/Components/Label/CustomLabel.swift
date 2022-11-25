//
//  CustomLabel.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct CustomLabel: View {
    
    let title: String
    let systemImage: String
    
    var body: some View {
        Label {
            Text(title)
                .font(.custom("Poppins-SemiBold", size: 10))
        } icon: {
            Image(systemName: systemImage)
                .frame(width: 13, height: 13)
                .foregroundColor(Color("Blue"))
        }
    }
}

struct CustomLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabel(title: "#fashion_me", systemImage: "person.fill")
    }
}
