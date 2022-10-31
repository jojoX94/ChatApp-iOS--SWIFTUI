//
//  TweetView.swift
//  ChatApp
//
//  Created by Madiapps on 20/10/2022.
//

import SwiftUI

struct TweetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text("Bogdan Vladmir")
                        .font(.custom("Poppins-Bold", size: 17))
                    Text("@ilya.cbv")
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundColor(Color(hex: "#6C7A9C"))
                }
            }
            
            ZStack(alignment: .bottom) {
                
                // FIX: Blur effect in buttons's actions not implemented
                
                Image("TweetIllustration")
                                .renderingMode(.original)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(alignment: .bottom) {
                                    HStack {
                                        HStack(spacing: 10) {
                                            CustomIcon(systemeName: "ellipsis.message.fill", count: "4")
                                            CustomIcon(systemeName: "suit.heart.fill", count: "6")
                                        }
                
                                        Spacer()
                
                                        HStack(spacing: 8) {
                                            CustomIcon(systemeName: "paperplane.fill")
                                            CustomIcon(systemeName: "bookmark.fill")
                                        }
                                    }
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 28)
                                    .overlay(content: {
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .blur(radius: 20)
                                    })
                                }
                
            }
            .frame(width: UIScreen.screenWidth - 60, height: UIScreen.screenHeight * 0.325)
            
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(hex: "#E6EEFA"))
        )
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView()
    }
}

extension TweetView {
//    private var image: Image {
//        Image("TweetIllustration")
//            .renderingMode(.original)
//            .resizable()
//            .frame(width: 350, height: 268)
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
