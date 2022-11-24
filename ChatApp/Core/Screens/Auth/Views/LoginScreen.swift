//
//  LoginView.swift
//  ChatApp
//
//  Created by Madiapps on 18/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    
    // MARK: PROPERTY
    
    @State var email = ""
    @State var password = ""
    @State var isRememberMe = false
    
    @EnvironmentObject var userViewModel: UserStateViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    // MARK: BODY
    
    var body: some View {
        NavigationStack {
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
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

// MARK: COMPONENTS

extension LoginScreen {
    private var headerView: some View {
        HStack(spacing: 30) {
            Button {
                presentationMode.wrappedValue.dismiss()
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
            CustomInputField(text: $email, title: "email", placeholder: "email").padding(.bottom, 18)
            
            CustomSecureInput(text: $password, title: "Password", placeholder: "at least 8 characters").padding(.bottom, 14)
        }
    }
    
    private var submitButton: some View {
        Button {
            Task {
                
                await userViewModel.login_v1(email: email, password: password) { responseCode, response in
                    if responseCode == 200 {
                        userViewModel.isLoggedIn = true
                        if let response = response {
                            KeychainWrapper.standard.set(response.accessToken, forKey: Defaults.accessToken)
                        }
                        
                    }
                }
                
            }
        } label: {
            Text("Login")
                .modifier(TextLargeButtonStyle())
        }
    }
    
    private var signUpLink: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundColor(.black.opacity(0.9))
            NavigationLink(destination: {
                SignUpScreen()
                    .navigationBarBackButtonHidden(true)
            }, label: {
                Text("Sign Up")
                   
            })
        }
        .font(.custom("Roboto-Medium", size: 11))
    }
}
