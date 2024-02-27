//
//  AuthenticationView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @StateObject var viewModel = AuthenticationViewViewModel()
    var body: some View {
        NavigationView{
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
                        .foregroundStyle(Color.primaryColor)
                    
                    Text("Management App")
                        .font(.system(size: 35, weight: .medium, design: .rounded))
                }
                .padding(.bottom, 30)
                
                
                
                VStack{
                    
                    Button {
                        Task {
                            await viewModel.signInWithGoogle()
                        }
                    } label: {
                        Text("Sign in with Google")
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(alignment: .leading) {
                                Image("google")
                                    .resizable()
                                    .frame(width: 30,height: 30, alignment: .center)
                            }
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    BTAuthButton(title: "SignUp", background: Color.primaryColor, textColor: Color.white, destination: RegisterView())
                    
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
