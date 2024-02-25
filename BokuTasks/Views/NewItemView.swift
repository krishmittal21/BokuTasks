//
//  NewItemView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI
import FirebaseFirestore

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
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }, backgroundColor: Color.primaryColor, text: "Save", textColor: .white)
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select a newer date"))
            })
        }
        .accentColor(Color.primaryColor)
    }
}
