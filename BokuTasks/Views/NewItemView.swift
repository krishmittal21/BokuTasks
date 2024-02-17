//
//  NewItemView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 100)
            Form{
                TextField("Task Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BTButton(action: {
                    viewModel.save()
                    newItemPresented = false
                }, backgroundColor: Color.newSecondary, text: "Save", textColor: .white)
                .padding()
            }
        }
    }
}
