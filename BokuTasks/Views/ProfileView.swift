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
        //To Implement
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.newPrimary)
            .frame(width: 125, height: 125)
        
        VStack(alignment: .leading){
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        BTButton(action: viewModel.logout , backgroundColor: Color.newPrimary, text: "Log Out", textColor: .white)
    }
}

#Preview {
    ProfileView()
}
