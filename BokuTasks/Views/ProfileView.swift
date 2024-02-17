//
//  ProfileView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        VStack{
            if let user = viewModel.user {
                profile(user: user)
            } else {
                Text("Loading Profile ...")
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Spacer()
        //To Implement
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.newPrimary)
            .frame(width: 125, height: 125)
            .padding()
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 10){
            HStack {
                Text("Name: ")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text(user.name)
                    .font(.body)
            }
            HStack {
                Text("Email: ")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text(user.email)
                    .font(.body)
            }
            HStack {
                Text("Member Since: ")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .font(.body)
            }
        }
        .padding()
        
        Spacer()
        
        BTButton(action: viewModel.logout , backgroundColor: Color.newPrimary, text: "Log Out", textColor: .white)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
