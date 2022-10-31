//
//  FeedView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView {
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension FeedView {
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
            Image("CameraIcon")
                .background(
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color(hex: "#E6EEFA"))
                    )
                .padding(.leading, 10)
                .padding(.bottom, 15)
        }
        
        ToolbarItem(placement: .principal) {
            Text("Home")
                .font(.custom("Poppins-SemiBold", size: 20))
                .foregroundColor(.black)
        }
        
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Image("NotifIcon")
                .background(
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color(hex: "#E6EEFA"))
                    )
                .padding(.trailing, 10)
                .padding(.bottom, 15)
        }
    }
}
