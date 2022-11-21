//
//  GDPR.swift
//  ChatApp
//
//  Created by Madiapps on 19/10/2022.
//

import SwiftUI

struct GDPR: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.black.opacity(0.8))
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                .padding(.bottom, 40)
                
                
                Image("Policy")
                    .background(
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color("LightYellow"))
                    )
                    .padding(.bottom, 60)
                
                
                Text("GDPR Consent Statement")
                    .font(.custom("Inter-SemiBold", size: 20.38))
                    .padding(.bottom, 20)
                
                Text("Lorem ipsum dolor sit amet, adet consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac nombrum is ea it neque. Lorem ipsum dolor sit amet. \n \n Lorem ipsum dolor sit amet, adet consectetur adipiscing elit.  Lorem ipsum dolor sit amet, adet consectetur adipiscing dolor sit amet, elit.Nulla quam velit, vulputate eu pharetra dolor sit amet, nec, mattis ac nombrum is ea it neque. Lorem ipsum dolor sit amet, adet consectetur adipiscing elit dolor sit amet. \n \n Lorem ipsum dolor sit amet, adet consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, dolor sit amet,mattis ac nombrum is ea it neque. ")
                    .font(.custom("Inter-Light", size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                
                
                
                VStack(spacing: 16) {
                    Button {
                        
                    } label: {
                        Text("Accept")
                            .font(.custom("Thin-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("Blue"))
                            )
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Decline")
                            .font(.custom("Thin-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("Blue"))
                            )
                        
                    }
                    
                }
            }
            .frame(width: UIScreen.screenWidth - 20)
            .padding(.horizontal)
            .padding(.vertical, 20)
        }
    }
}

struct GDPR_Previews: PreviewProvider {
    static var previews: some View {
        GDPR()
    }
}
