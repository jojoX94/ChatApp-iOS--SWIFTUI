//
//  CreateStoryView.swift
//  ChatApp
//
//  Created by Madiapps on 20/10/2022.
//

import SwiftUI

struct CreateStoryView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("LightBlue"), lineWidth: 2)
                        .frame(width: 70, height: 70)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title)
                        }
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

struct CreateStoryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStoryView()
    }
}
