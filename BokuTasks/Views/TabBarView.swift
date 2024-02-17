//
//  TabBarView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            TaskListView()
                .tabItem {
                    Label("", systemImage: "checklist")
                }
            CalenderView()
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

#Preview {
    TabBarView()
}
