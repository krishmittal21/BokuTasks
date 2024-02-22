//
//  ContentView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            AuthenticationView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            TaskListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("", systemImage: "checklist")
                }
            CalendarView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("", systemImage: "calendar")
                }
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person.circle")
                }
        }
        .accentColor(Color.newPrimary)
    }
}
