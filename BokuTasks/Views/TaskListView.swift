//
//  TaskListView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TaskListView: View {
    
    @StateObject var viewModel: TaskListViewViewModel
    @FirestoreQuery var items: [TaskItem]
    private let userId: String
    @State var isTodoSelected = true
    
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        self._viewModel = StateObject(wrappedValue: TaskListViewViewModel(userId: userId))
    }
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .trailing){
                                
                HStack(spacing: 100){
                    Button(action: {
                        isTodoSelected = true
                    }) {
                        Text("Todo")
                            .foregroundColor(isTodoSelected ? .newPrimary : .black)
                    }
                    Button(action: {
                        isTodoSelected = false
                    }) {
                        Text("Completed")
                            .foregroundColor(isTodoSelected ? .black : .newPrimary)
                    }
                }
                .padding(.horizontal,65)

                if isTodoSelected {
                    tasksLeft
                } else {
                    tasksCompleted
                }
                
                Button{
                    viewModel.showingNewItem = true
                } label: {
                    ZStack(){
                        Circle()
                            .foregroundStyle(Color.newPrimary)
                            .frame(width: 70)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                }
            }
            .navigationTitle("Tasks")
            .padding()
            .sheet(isPresented: $viewModel.showingNewItem ){
                NewItemView(newItemPresented: $viewModel.showingNewItem)
            }
            .background(Color.backgroundColor)
        }
        
    }
    
    
    @ViewBuilder
    var tasksLeft: some View {
        let filteredItems = items.filter { !$0.isDone }.sorted(by: {$0.dueDate < $1.dueDate})
        ZStack{
            List(filteredItems) { item in
                TaskListItemView(item: item)
                    .swipeActions{
                        Button("Delete"){
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
            }
            .listStyle(PlainListStyle())
            .cornerRadius(10)
        }
    }
    
    
    @ViewBuilder
    var tasksCompleted: some View {
        let filteredItems = items.filter { $0.isDone }.sorted(by: {$0.dueDate < $1.dueDate})
        ZStack{
            List(filteredItems) { item in
                TaskListItemView(item: item)
                    .swipeActions{
                        Button("Delete"){
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
            }
            .listStyle(PlainListStyle())
            .cornerRadius(10)
        }
    }
    
}
 

#Preview {
    TaskListView(userId: "HCbFqqujIRZXoDFGBGvhdIpVDpM2")
}
