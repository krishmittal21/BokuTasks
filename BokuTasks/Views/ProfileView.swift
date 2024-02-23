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
        NavigationView {
            ScrollView {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.newPrimary)
                        .frame(width: 85, height: 85)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(user.name)
                            .font(.body)
                        Text(user.email)
                            .font(.body)
                        HStack {
                            Text("Member Since: ")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                                .font(.body)
                        }
                    }
                }
                
                Spacer()

                BTButton(action: viewModel.logout, backgroundColor: .white, text: "Log Out", textColor: .red)

            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ProfileView()
}
