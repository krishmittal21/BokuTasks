//
//  NewItemViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {
        
    }
    func save(){
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
