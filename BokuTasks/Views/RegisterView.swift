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
            Spacer()
            VStack{
                Text("Complete Your Profile")
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 27)
                Text("Don't worry only you can see your personal info, no one else will be able to see it")
                    .frame(width: 350)
                    .font(.system(size: 15))
                    .foregroundStyle(Color.gray)
                    //.padding(.top, 3)
            }
            Spacer()
            if  !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            Form {
                Section{
                    HStack{
                        Image(systemName: "person")
                            .foregroundStyle(Color.gray)
                            .padding(.leading, 8)
                        TextField("Full Name", text: $viewModel.name)
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
                Section{
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                
            }
            .listSectionSpacing(10)
            .frame(height: 350)
            .scrollContentBackground(.hidden)
            .padding(.bottom,10)
            
            //To Implement
            Text("By Signing Up, you agree to our ")
            +
            Text("Terms & Conditions")
                .foregroundStyle(Color.primaryColor)
            +
            Text(" and ")
            +
            Text("Privacy Policy.")
                .foregroundStyle(Color.primaryColor)
            BTButton(action: viewModel.register, backgroundColor: Color.primaryColor, text: "Sign Up", textColor: .white)
            .padding(.bottom,10)
            
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
    }
}

#Preview {
    RegisterView()
}
