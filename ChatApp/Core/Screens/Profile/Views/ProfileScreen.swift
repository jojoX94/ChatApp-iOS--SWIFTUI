//
//  ProfileScreen.swift
//  ChatApp
//
//  Created by Madiapps on 21/11/2022.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(spacing: 0) {
                Image("CoverProfile")
                    .resizable()
                .frame(maxHeight: 193)
                
                VStack(spacing: 22) {
                    Text("@fashion_me")
                        .font(.custom("Poppins-SemiBold", size: 12))
                        .foregroundColor(.black)
                    HStack(spacing: 18) {
                        CustomLabel(title: "#fashion_tag", systemImage: "person.fill")
                        CustomLabel(title: "Cairo, Egypt", systemImage: "location.magnifyingglass")
                        CustomLabel(title: "4 March 1990", systemImage: "birthday.cake.fill")
                    }
                   
                    AddNewPostButton
                    
                    HStack(spacing: 40) {
                        CountLabel(count: "10", title: "Posts")
                        CountLabel(count: "1.3K", title: "Followers")
                        CountLabel(count: "149", title: "Following")
                    }

                }
                .padding(.top, 56)
                .padding(.bottom, 41)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 10, x: 5, y: 5)
                )
                .offset(y: -25)
                .overlay(alignment: .top) {
                     Image("profileIllustration")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color("LightBlue"), lineWidth: 5)
                                .frame(width: 95, height: 95)
                        }
                        .offset(y: -70)
                }
                
                
                Spacer()
            }
            
            
        }
        .ignoresSafeArea()
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

extension ProfileScreen {
    var AddNewPostButton: some View {
        Button {
            
        } label: {
            Label {
                Text("Add new Post")
                    .font(.custom("Poppins-Medium", size: 11))
                    .foregroundColor(.black.opacity(0.5))
            } icon: {
                Image(systemName: "doc.badge.plus")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Color(hex: "#C4C4C4").opacity(0.6))

        }
    }
}
