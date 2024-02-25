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
            
            Image(systemName: item.isDone ? "checkmark.square" : "square")
                .onTapGesture {
                    viewModel.toggleCompletionStatus(item: item)
                }
            
            Text(item.title)
                .font(.headline)
                .bold()
            
            Spacer()
            
            Text(viewModel.dueDateString(item: item))
                .font(.footnote)
        }
    }
}

#Preview {
    TaskListItemView(item: .init(id: "123", title: "milk" ,dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
