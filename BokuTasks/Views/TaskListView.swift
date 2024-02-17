//
//  TaskListView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskListViewViewModel()
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

#Preview {
    TaskListView(userId: "")
}
