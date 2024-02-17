//
//  NewItemViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {
        
    }
    

    func save(){
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = TaskItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("tasks")
            .document(newId)
            .setData(newItem.asDictionary())
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
