//
//  FeedView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack() {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 25) {
                    CreateStoryView()
                    ForEach(0 ..< 10) { index in
                        StoryRowView()
                    }
                }
            }
            
            
            Text("Hello everyone")
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
