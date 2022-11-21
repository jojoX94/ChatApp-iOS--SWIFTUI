//
//  MessageView.swift
//  ChatApp
//
//  Created by Madiapps on 08/11/2022.
//

import SwiftUI

struct MessageScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
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
                                    
                                    NavigationLink {
                                        DetailMessageScreen()
                                    } label: {
                                        MessageRowView()
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .toolbar(content: myToolBarContent)
        }

    }
}

struct MessageScreen_Previews: PreviewProvider {
    static var previews: some View {
        MessageScreen()
    }
}

extension MessageScreen {
    
    @ToolbarContentBuilder
    func myToolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack(spacing: 7) {
                Text("Message")
                    .font(.custom("Poppins-SemiBold", size: 20))
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                IconButton(systemName: "plus.rectangle", badgeCount: 7) {
                    
                }
                    
                IconButton(systemName: "message", badgeCount: 3) {
                        
                }

                IconButton(systemName: "phone", badgeCount: 1) {
                    
                }
            }
            .foregroundColor(.black)
        }
    }
}
