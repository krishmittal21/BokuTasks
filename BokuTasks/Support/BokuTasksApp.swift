//
//  BokuTasksApp.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI
import FirebaseCore
@main
struct BokuTasksApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
