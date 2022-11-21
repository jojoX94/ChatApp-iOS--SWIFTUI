//
//  DetailMessageView.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct DetailMessageScreen: View {
    
    //MARK: PROPERTY
    
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var textMessage: String = ""
    
    //TODO: Remove fake list by real value in API call
    @State var listMessages: [Message] = [Message(content: "Good Luck Bro", user: User(name: "Billy", avatar: "avatar_illustration", isCurrentUser: true)),Message(content: "Good Luck Bro", user: User(name: "Billy", avatar: "avatar_illustration")),Message(content: "buh do u have an idea on the price", user: User(name: "Billy", avatar: "avatar_illustration", isCurrentUser: true)),Message(content: "because the last guy i called told me around $650", user: User(name: "Billy", avatar: "avatar_illustration", isCurrentUser: true)),Message(content: "yh i tink i should have an idea on the price, but it’s definetly in ur budget", user: User(name: "Billy", avatar: "avatar_illustration")),Message(content: "i think so", user: User(name: "Billy", avatar: "avatar_illustration")),Message(content: "REALLY... wow... thanks man", user: User(name: "Billy", avatar: "avatar_illustration", isCurrentUser: true))]
    
    //MARK: FUNCTION
    
    func sendMessage() {
        withAnimation(.spring()) {
            listMessages.append(Message(content: textMessage, user: User(name: "Bill", avatar: "", isCurrentUser: true)))
        }
        textMessage = ""
    }
    
    //MARK: BODY
    
    var body: some View {
        VStack(alignment: .leading) {


            
            ScrollView() {
                LazyVStack(spacing: 25) {
                    ForEach(listMessages) { message in
                        MessageView(currentMessage: message)
                    }
                }
                
            }
            
            Spacer()
            
            HStack {
                MessageTextField(textMessage: $textMessage, actionButton: sendMessage)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("RecordIcon")
                        .frame(width: 18, height: 28)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(
                            Circle()
                                .foregroundColor(Color(hex: "#2488DA"))
                        )
                }

            }
        }
        .padding(.horizontal, 10)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: { myToolBarContent() })
        .onAppear {
            viewRouter.tabBarHidden = true
        }
        .onDisappear {
            
        }
        
    }
}

struct DetailMessageScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailMessageScreen()
            .environmentObject(ViewRouter())
    }
}

extension DetailMessageScreen {
    
    @ToolbarContentBuilder
    func myToolBarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack(spacing: 7) {
                
                IconButton(systemName: "chevron.backward") {
                    viewRouter.tabBarHidden = false
                    presentationMode.wrappedValue.dismiss()
                }
                
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.brown)
                VStack {
                    Text("User_")
                        .font(.custom("Poppins-SemiBold", size: 10))
                    Text("typing")
                        .font(.custom("Poppins-SemiBold", size: 10))
                        .foregroundColor(Color(hex: "#5DD33F"))
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                IconButton(systemName: "phone") {}
                IconButton(systemName: "video") {}
            }
            .foregroundColor(.black)
        }
    }
}
