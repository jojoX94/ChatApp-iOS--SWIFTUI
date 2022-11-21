//
//  MessageTextField.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct MessageTextField: View {
    
    @Binding var textMessage: String
    var actionButton: () -> Void
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "face.smiling")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }

            TextField("write your message", text: $textMessage)
                .font(.custom("Poppins-SemiBold", size: 10))
                .foregroundColor(.black.opacity(0.62))
            
            if !textMessage.isEmpty {
                Button {
                    actionButton()
                } label: {
                    Image("SendMessageIcon")
                        .frame(width: 20, height: 20)
                }

            }
            
            Button {
               
            } label: {
                Image("AttachmentIcon")
                    .frame(width: 17, height: 20)
                    .foregroundColor(.black)
            }
            Button {
                
            } label: {
                Image("PickPhotoIcon")
                    .frame(width: 17, height: 20)
                    .foregroundColor(.black)
            }

        }
        .frame(maxWidth: 300)
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(hex: "#EBEBEB"))
        )
    }
}

struct MessageTextField_Previews: PreviewProvider {
    static var previews: some View {
        MessageTextField(textMessage: .constant("")) {
            
        }
    }
}
