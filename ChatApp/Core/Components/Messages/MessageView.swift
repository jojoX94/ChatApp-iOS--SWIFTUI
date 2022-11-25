//
//  MessageView.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct MessageView: View {
    
    var currentMessage: Message
    
    var body: some View {
        HStack {
            if !currentMessage.user.isCurrentUser {
                Image(currentMessage.user.avatar)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            
            ContentMessageView(contentMessage: currentMessage.content, isCurrentUser: currentMessage.user.isCurrentUser)
            
            if !currentMessage.user.isCurrentUser {
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: Message(content: "Good luck guys", user: User(name: "Billy", avatar: "avatar_illustration")))
    }
}
