//
//  TaskListViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation
import FirebaseFirestore
class TaskListViewViewModel: ObservableObject {
    @Published var showingNewItem = false
    @Published var userName: String = ""
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
        fetchUserName()
    }
    
    func fetchUserName(){
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.userName = data["name"] as? String ?? ""
            }
        }
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("tasks")
            .document(id)
            .delete()
    }
}
