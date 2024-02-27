//
//  AuthenticationView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI
import AuthenticationServices
import CryptoKit
import GoogleSignIn
import GoogleSignInSwift

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
                .padding(.bottom, 10)
                
                
                
                VStack{
                    
                    Button {
                        Task {
                            await viewModel.signInWithGoogle()
                        }
                    } label: {
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 20,height: 20)
                            Text("Sign in with Google")
                                .foregroundStyle(.black)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    //ToDo
                    /*
                    SignInWithAppleButton { request in
                        
                    } onCompletion: { result in
                        
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50)
                    .cornerRadius(8)
                    
                    Spacer()
                    */
                    
                    NavigationLink(destination: RegisterView()) {
                        HStack{
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: 25,height: 20)
                                .foregroundStyle(.blue)
                            Text("Sign in with Email")
                                .foregroundStyle(.black)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                    .buttonStyle(.bordered)
                    .navigationTitle("")
                    .navigationBarBackButtonHidden(true)
                    
                    Spacer()
                    
                    HStack{
                        Text("Already have an account?")
                            .foregroundStyle(Color.gray)
                        NavigationLink{
                            LoginView()
                        } label: {
                            Text("Log In")
                                .underline()
                                .foregroundStyle(Color.primaryColor)
                        }
                    }
                    .padding(10)
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
