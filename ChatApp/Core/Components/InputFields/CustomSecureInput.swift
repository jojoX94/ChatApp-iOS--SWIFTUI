//
//  CustomSecureInput.swift
//  ChatApp
//
//  Created by Madiapps on 18/10/2022.
//

import SwiftUI

// Using the enum makes the code clear as to what field is focused.
enum focusedField {
    case secure, unSecure
}

struct CustomSecureInput: View {
    @Binding var text: String
    @State var isSecure: Bool = true
    var title: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title.capitalized)
                .font(.custom("Roboto-Medium", size: 15))
            HStack{
                Group{
                    if isSecure{
                        SecureField("", text: $text)
                    }else{
                        TextField("", text: $text)
                    }
                }
                .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholder.lowercased()))
                .font(.custom("Roboto-Light", size: 13))
                .animation(.easeInOut(duration: 0.1), value: isSecure)          .padding(.vertical, 12)
                .padding(.leading, 18)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                
                Button(action: {
                    isSecure.toggle()
                }, label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye" )
                        .frame(width: 16.0, height: 12.0)
                        .accentColor(.black.opacity(0.5))
                })
                
                .padding(.trailing, 10)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

struct CustomSecureInput_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureInput(text: .constant(""), title: "Password", placeholder: "password")
    }
}
