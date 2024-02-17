//
//  TaskListView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI
import FirebaseFirestoreSwift
struct TaskListView: View {
    @StateObject var viewModel = TaskListViewViewModel()
    @FirestoreQuery var items: [TaskItem]
    private let userId: String
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    Text(item.title)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    viewModel.showingNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItem ){
                NewItemView(newItemPresented: $viewModel.showingNewItem)
            }
        }
        
    }
}

#Preview {
    TaskListView(userId: "HCbFqqujIRZXoDFGBGvhdIpVDpM2")
}
