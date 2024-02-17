//
//  TaskListItemViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class TaskListItemViewViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone(item: TaskItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
