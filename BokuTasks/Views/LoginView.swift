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
            Text("Log In")
                .font(.system(size: 35, weight: .medium, design: .rounded))
                .padding(.top,50)
                .ignoresSafeArea()
            Spacer()
            if  !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            Form {
    
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
            }
            Button {
                viewModel.login()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.blue)
                        .frame(width: 150, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    Text("Log In")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
