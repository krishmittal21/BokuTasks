//
//  TaskListItemView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct TaskListItemView: View {
    let item: TaskItem
    @StateObject var viewModel = TaskListItemViewViewModel()
   
    var body: some View {
        HStack{
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.square" : "square")
            }
            
            Text(item.title)
                .font(.headline)
                .bold()
            
            Spacer()
            
            Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                //.foregroundStyle(Color.newPrimary)
        }
    }
}

#Preview {
    TaskListItemView(item: .init(id: "123", title: "milk" ,dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
