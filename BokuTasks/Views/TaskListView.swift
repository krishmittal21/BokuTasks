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
                        Text("To-Do")
                            .padding(10)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(isTodoSelected ? Color.white : Color.clear)
                            )
                    }
                    
                    Button(action: {
                        isTodoSelected = false
                    }) {
                        Text("Done")
                            .padding(10)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(isTodoSelected ? Color.clear : Color.white)
                            )
                    }
                }
                .padding(.horizontal,65)

                if isTodoSelected {
                    tasksLeft
                } else {
                    tasksDone
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
            .navigationTitle(Text("Hi \(viewModel.userName)!"))
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
    var tasksDone: some View {
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
