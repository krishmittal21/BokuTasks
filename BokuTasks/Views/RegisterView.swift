//
//  RegisterView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            Text("Sign Up")
                .font(.system(size: 35, weight: .medium, design: .rounded))
                .foregroundStyle(Color.gray)
                .padding(.top, 50)
                .ignoresSafeArea()
            Spacer()
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
            }
            Button {
                viewModel.register()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.blue)
                        .frame(width: 150, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    Text("Sign Up")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            
        }
    }
}

#Preview {
    RegisterView()
}
