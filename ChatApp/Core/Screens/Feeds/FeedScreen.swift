//
//  FeedView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct FeedScreen: View {
    
    // MARK: BODY
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    storiesList
                    
                    feedsList
                }
            }
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: myToolBarContent)
            
        }
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen()
    }
}

// MARK: COMPONENTS

extension FeedScreen {
    private var storiesList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack( spacing: 25) {
                CreateStoryView()
                ForEach(0 ..< 10) { index in
                    StoryRowView()
                }
            }
            .padding(.leading)
        }
    }
    
    private var feedsList: some View {
        LazyVStack(spacing: 20) {
            ForEach(0 ..< 10) { index in
                TweetView()
            }
        }
    }
    
    
    @ToolbarContentBuilder
    func myToolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                Image("CameraIcon")
                    .background(
                        Circle()
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color(hex: "#E6EEFA"))
                    )
            }
            .padding(.leading, 10)
            .padding(.vertical, 20)
        }
        
        
        ToolbarItem(placement: .principal) {
            Text("Home")
                .font(.custom("Poppins-SemiBold", size: 20))
                .foregroundColor(.black)
                .padding(.vertical, 20)
        }
        
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Image("NotifIcon")
                .background(
                    Circle()
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color(hex: "#E6EEFA"))
                )
                .padding(.trailing, 10)
                .padding(.vertical, 20)
        }
    }
}
