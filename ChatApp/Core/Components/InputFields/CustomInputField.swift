//
//  CustomInputField.swift
//  ChatApp
//
//  Created by Madiapps on 18/10/2022.
//

import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    var title: String
    var placeholder : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.custom("Roboto-Medium", size: 15))
            TextField("", text: $text)
                .font(.custom("Roboto-Light", size: 13))
                .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholder.lowercased()))
                .padding(.vertical, 12)
                .padding(.leading, 18)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(text: .constant(""), title: "Username", placeholder: "Username")
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .font(.custom("Roboto-Light", size: 13))
                    .foregroundColor(.gray)
            }
            content
        }
    }
}
