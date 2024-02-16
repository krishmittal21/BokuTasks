//
//  LoginView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        VStack{
            Spacer()
            Text("Hello There! ")
                .font(.system(size: 35, weight: .medium, design: .rounded))
                .padding(.top,50)
            if  !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            Form {
                
                Section{
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundStyle(Color.gray)
                            .padding(.leading, 8)
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                Section{
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                //To Implement
                Text("Forgot Password? ")
                    .foregroundStyle(Color.newPrimary)
            }
            .listSectionSpacing(10)
            .frame(height: 350)
            .scrollContentBackground(.hidden)
            Button {
                viewModel.login()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.newPrimary)
                        .frame(width: 320, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    Text("Log In")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            VStack{
                // To Implement Functionality
                Text("or log in with")
                    .foregroundStyle(Color.gray)
                HStack(spacing: 30){
                    Image("apple")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image("meta")
                        .resizable()
                        .frame(width: 50, height: 35)
                    Image("google")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(Color.gray)
                NavigationLink{
                    RegisterView()
                } label: {
                    Text("Sign In")
                        .underline()
                        .foregroundStyle(Color.newPrimary)
                }
            }
            .padding(10)
            
        }
    }
}

#Preview {
    LoginView()
}
