//
//  SignUpView.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct SignUpScreen: View {
    
    // MARK: PROPERTY
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var isRememberMe = false
    
    @State var isMarked = false
    @State var termsIsVisible = false
    @State var privacyIsVisible = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userViewModel: UserStateViewModel
    
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
        .sheet(isPresented: $termsIsVisible) {
            GDPR()
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

// MARK: COMPONENTS

extension SignUpScreen {
    private var headerView: some View {
        HStack(spacing: 30) {
            Button {
                presentationMode.wrappedValue.dismiss()
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
    
    private var listTextFields: some View {
        Group {
            CustomInputField(text: $username, title: "Username", placeholder: "username").padding(.bottom, 18)
            
            CustomInputField(text: $email, title: "E-mail", placeholder: "example@email.com").padding(.bottom, 18)
            
            CustomSecureInput(text: $password, title: "Password", placeholder: "at least 8 characters").padding(.bottom, 14)
        }
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
                            termsIsVisible.toggle()
                        }
                    
                }.font(.custom("Roboto-Regular", size: 11))
                
            }
            Spacer()
            
        }
        .padding(.bottom, 27)
    }
    
    private var submitButton: some View {
        Button {
            Task {
                await userViewModel.signUp_v1(name: username, email: email, password: password)
//                await userViewModel.getAllPRODUCT()
//                await userViewModel.signUp(email: email, password: password)
                
            }
        } label: {
            Text("Sign Up")
                .modifier(TextLargeButtonStyle())
        }
    }
    
    private var signUpLink: some View {
        HStack {
            Text("I'm already an account.")
                .foregroundColor(.black.opacity(0.9))
            NavigationLink {
                LoginScreen()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Sign In")
                    .foregroundColor(Color("Blue"))
            }

            
        }
        .font(.custom("Roboto-Light", size: 11))
    }
    
}
