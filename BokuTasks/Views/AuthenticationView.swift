//
//  AuthenticationView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack(){
            Image("logo-transparent")
                .resizable()
                .frame(width: 450, height: 450)
            VStack{
                Text("Your ")
                        .font(.system(size: 35, weight: .medium, design: .rounded))
                +
                Text("Everyday Task ")
                        .font(.system(size: 35, weight: .medium, design: .rounded))
                        .foregroundColor(Color.newPrimary)
                
                Text("Management App")
                        .font(.system(size: 35, weight: .medium, design: .rounded))
            }
            .padding(.bottom, 20)
            HStack{
                BTAuthButton(title: "SignUp", background: Color.newPrimary, textColor: Color.white) {
                }
                Spacer()
                BTAuthButton(title: "LogIn", background: Color.white, textColor: Color.black) {
                }
            }
            .padding(40)
        }
        
    }
}

#Preview {
    AuthenticationView()
}
