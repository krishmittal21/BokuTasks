//
//  AuthenticationView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationView{
            VStack(){
                
                Image("logo-transparent")
                    .resizable()
                    .frame(width: 450, height: 450)
                /* To Change The Logo
                Text("Boku Tasks")
                    .font(.system(size: 40, weight: .medium, design: .rounded))
                    .foregroundStyle(Color.newPrimary)
                    .padding(.bottom, 20)
                */
                VStack{
                    Text("Your ")
                            .font(.system(size: 35, weight: .medium, design: .rounded))
                    +
                    Text("Everyday Task ")
                            .font(.system(size: 35, weight: .medium, design: .rounded))
                            .foregroundStyle(Color.newPrimary)
                    
                    Text("Management App")
                            .font(.system(size: 35, weight: .medium, design: .rounded))
                }
                .padding(.bottom, 30)
                
                HStack{
                    BTAuthButton(title: "SignUp", background: Color.newPrimary, textColor: Color.white, destination: RegisterView())
                        
                    
                    Spacer()
                    
                    BTAuthButton(title: "LogIn", background: Color.white, textColor: Color.black, destination: LoginView())
                }
                .padding(40)
            }
        }
        .accentColor(.gray)
        
    }
}

#Preview {
    AuthenticationView()
}
