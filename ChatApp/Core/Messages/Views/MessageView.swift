//
//  MessageView.swift
//  ChatApp
//
//  Created by Madiapps on 08/11/2022.
//

import SwiftUI

struct MessageView: View {
    
    @State var textSearch = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                TextField("Search Contacts", text: $textSearch)
                    .font(.custom("Poppins-SemiBold", size: 12))
                    .foregroundColor(.black.opacity(0.3))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(hex: "#F1F0F0"))
                    )
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 35) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack( spacing: 25) {
                                CreateStoryView()
                                ForEach(0 ..< 10) { index in
                                    StoryRowView()
                                }
                            }
                            .padding(.horizontal, 5)
                        }
                        
                        VStack {
                            HStack {
                                Text("Direct messages")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                HStack {
                                    Group {
                                        Text("0")
                                        Text("request")
                                    }
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .foregroundColor(.black.opacity(0.28))
                                }
                            }
                            
                            LazyVStack(spacing: 20) {
                                ForEach(0..<20) { _ in
                                    MessageRowView()
                                }
                            }
                        }
                    }
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
