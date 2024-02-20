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
                            .foregroundColor(isTodoSelected ? .blue : .black)
                    }
                    Button(action: {
                        isTodoSelected = false
                    }) {
                        Text("Completed")
                            .foregroundColor(isTodoSelected ? .black : .blue)
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
            .background(LinearGradient(gradient: Gradient(colors: [Color.Gradient1, Color.Gradient2, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
    }
    
    
    @ViewBuilder
    var tasksLeft: some View {
        let filteredItems = items.filter { !$0.isDone }
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
        let filteredItems = items.filter { $0.isDone }
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
    }
}
 

#Preview {
    TaskListView(userId: "HCbFqqujIRZXoDFGBGvhdIpVDpM2")
}
