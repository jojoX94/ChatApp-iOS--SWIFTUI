//
//  SplashScreen.swift
//  ChatApp
//
//  Created by Madiapps on 25/11/2022.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isActive: Bool
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Image(systemName: "message.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                Text("BizTalks")
                    .font(.custom("Poppins-Medium", size: 28))
                    .foregroundColor(.white)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.blue)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isActive = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(isActive: .constant(false))
    }
}
