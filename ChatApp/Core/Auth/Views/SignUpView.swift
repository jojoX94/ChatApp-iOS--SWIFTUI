//
//  SignUpView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: PROPERTY
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var isRememberMe = false
    
    @State var isMarked = false
    @State var termsIsVisible = false
    @State var privacyIsVisible = false
    
    // MARK: BODY
    var body: some View {
        ZStack {
            
            Color("Blue")
                .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                headerView
                
                VStack(spacing: 0) {
                    Image("trip")
                    
                    VStack(spacing: 0) {
                        CustomInputField(text: $username, title: "Username", placeholder: "username").padding(.bottom, 18)
                        
                        CustomInputField(text: $email, title: "E-mail", placeholder: "example@email.com").padding(.bottom, 18)
                        
                        CustomSecureInput(text: $password, title: "Password", placeholder: "at least 8 characters").padding(.bottom, 14)
                        
                        authAction
                        
                        Button {
                            print("Button Login clicked => \(username) \(email) \(password)")
                        } label: {
                            Text("Sign Up")
                                .font(.custom("Roboto-Medium", size: 15))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("Blue"))
                                )
                        }
                        
                        Spacer()
                        
                        signUpLink
                        
                        Spacer()

                    }
                    .padding(.horizontal)
                        
                }
                .background(Color.white)
                .clipShape(RoundedShape(corners: [.topLeft, .topRight]))
            }
        }
        .sheet(isPresented: $termsIsVisible) {
            GDPR()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

// MARK: COMPONENTS
extension SignUpView {
    private var headerView: some View {
        HStack(spacing: 30) {
            Button {
                print("Back button clicked")
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Text("Sign Up.")
                .font(.custom("Roboto-Black", size: 36))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var authAction: some View {
        HStack {
            Image(systemName: self.isMarked ? "checkmark.square.fill" : "square")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 13, height: 13)
                .onTapGesture {
                    isMarked.toggle()
                }
            
            HStack(spacing: 0) {
                Group {
                    Text("I agree with")
                        .foregroundColor(.black.opacity(0.8))
                    Text("Terms ")
                        .foregroundColor(Color("Blue"))
                        .onTapGesture {
                            termsIsVisible.toggle()
                        }
                    Text("and ")
                        .foregroundColor(.black.opacity(0.8))
                    Text("Privacy")
                        .foregroundColor(Color("Blue"))
                        .onTapGesture {
                            print("Show Privacy sheet")
                        }
                    
                }.font(.custom("Roboto-Regular", size: 11))
                
            }
            Spacer()

        }
        .padding(.bottom, 27)
    }
    
    private var signUpLink: some View {
        HStack {
            Text("I'm already an account.")
                .font(.custom("Roboto-Light", size: 11))
                .foregroundColor(.black.opacity(0.9))
            Text("Sign In")
                .font(.custom("Roboto-Medium", size: 11))
                .foregroundColor(Color("Blue"))
                .onTapGesture {
                    print("Button Sign Up Tapped")
                }
        }
    }
}
