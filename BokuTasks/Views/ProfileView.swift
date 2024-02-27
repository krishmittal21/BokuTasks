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
        NavigationView {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack{
                    if let user = viewModel.user {
                        profile(user: user)
                    } else {
                        Text("Loading Profile ...")
                    }
                }
                .navigationTitle("Settings")
                .onAppear{
                    viewModel.fetchUser()
                }
            }
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        
        VStack(alignment: .leading){
            
            Text(user.name)
                .font(.body)
                .bold()
            
            Text(user.email)
                .font(.body)
            
            HStack {
                Text("Member Since: ")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                    .font(.body)
            }
        }
        .padding(.top, 30)
        
        Spacer()
        
        BTSettingsButton(title: "Edit Profile", destination: EditProfileView(), icon: "person.circle")
                
        BTSettingsButton(title: "About",  destination: AboutView(), icon: "doc.fill")
        
        BTSettingsButton(title: "Privacy",  destination: PrivacyView(), icon: "hand.raised.slash.fill")
        
        BTSettingsButton(title: "Widgets", destination: WidgetView(), icon: "rectangle.grid.2x2.fill")
        
        Spacer()
        
        Button {
            viewModel.logout()
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 40)
                
                Text("Log Out")
                    .foregroundStyle(.pink)
                    .font(.system(size: 15))
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ProfileView()
}

