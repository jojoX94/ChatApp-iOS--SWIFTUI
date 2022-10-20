//
//  StoryRowView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct StoryRowView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("LightBlue"), lineWidth: 2)
                        .frame(width: 70, height: 70)
                }
                .padding(.vertical, 6)
                
            Text("car.street")
                .font(.custom("Poppins-SemiBold", size: 13))
        }
        .onTapGesture {
            print("User story row clicked")
        }
    }
}

struct StoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        StoryRowView()
    }
}
