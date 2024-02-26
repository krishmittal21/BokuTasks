//
//  ContentView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @State var isHamburgerMenu = false
    
    var body: some View {
        NavigationView{
            ZStack{
                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                    accountView
                } else {
                    AuthenticationView()
                }
            }
            .navigationBarItems(leading: {
                Button(action: {
                    withAnimation {
                        self.isHamburgerMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                }
            }())
            .sheet(isPresented: $isHamburgerMenu) {
                ProfileView()
            }
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
        }
        .accentColor(Color.primaryColor)
    }
}
