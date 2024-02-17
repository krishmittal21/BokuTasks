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
    private let userId: String
    init(userId: String) {
        self.userId = userId
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
