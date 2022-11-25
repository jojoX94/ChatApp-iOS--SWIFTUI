//
//  TextLargeButtonStyle.swift
//  ChatApp
//
//  Created by Madiapps on 07/11/2022.
//

import Foundation
import SwiftUI

struct TextLargeButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Roboto-Medium", size: 15))
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Blue"))
            )
    }
}

