//
//  CountLabel.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct CountLabel: View {
    
    let count: String
    let title: String
    
    var body: some View {
        VStack {
            Text(count)
                .font(.custom("Poppins-SemiBold", size: 18))
            Text(title)
                .font(.custom("Poppins-Medium", size: 9))
                .foregroundColor(Color(hex: "#989898"))
        }

    }
}

struct CountLabel_Previews: PreviewProvider {
    static var previews: some View {
        CountLabel(count: "10", title: "Posts")
    }
}
