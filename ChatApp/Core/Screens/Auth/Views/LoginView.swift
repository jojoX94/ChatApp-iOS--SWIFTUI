//
//  LoginView.swift
//  ChatApp
//
//  Created by Madiapps on 18/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: PROPERTY
    
    @State var username = ""
    @State var password = ""
    @State var isRememberMe = false
    
    
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
                        
                        listTextFields
                        
                        authAction
                        
                        submitButton
                        
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// MARK: COMPONENTS

extension LoginView {
    private var headerView: some View {
        HStack(spacing: 30) {
            Button {
                print("Back button clicked")
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            Text("Log In.")
                .font(.custom("Roboto-Black", size: 36))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var authAction: some View {
        HStack {
            CheckboxField(id: "", label: "remember me", size: 13, color: .gray, textSize: 11) { _,_  in }
            
            Spacer()
            
            Button {
                print("Button clicked")
            } label: {
                Text("Forgot Password ?")
                    .font(.custom("Robto-Regular", size: 11))
            }
            
        }
        .padding(.bottom, 27)
    }
    
    private var listTextFields: some View {
        Group {
            CustomInputField(text: $username, title: "Username", placeholder: "username").padding(.bottom, 18)
            
            CustomSecureInput(text: $password, title: "Password", placeholder: "at least 8 characters").padding(.bottom, 14)
        }
    }
    
    private var submitButton: some View {
        Button {
            print("Button Login clicked => \(username) \(password)")
        } label: {
            Text("Login")
                .modifier(TextLargeButtonStyle())
        }
    }
    
    private var signUpLink: some View {
        HStack {
            Text("Don't have an account?")
                .font(.custom("Roboto-Light", size: 11))
                .foregroundColor(.black.opacity(0.9))
            Text("Sign Up")
                .font(.custom("Roboto-Medium", size: 11))
                .foregroundColor(Color("Blue"))
                .onTapGesture {
                    print("Button Sign Up Tapped")
                }
        }
    }
}
