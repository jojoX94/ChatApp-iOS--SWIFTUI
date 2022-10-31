//
//  FeedView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack( spacing: 25) {
                        CreateStoryView()
                        ForEach(0 ..< 10) { index in
                            StoryRowView()
                        }
                    }
                    .padding(.leading)
                }
                
                LazyVStack(spacing: 20) {
                    ForEach(0 ..< 10) { index in
                        TweetView()
                    }
                }
                
                Text("Hello everyone")
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
