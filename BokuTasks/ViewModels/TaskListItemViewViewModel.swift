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
    
    let calendar = Calendar.current
    
    func dueDateString( item: TaskItem) -> String {
        
        let dueDate = Date(timeIntervalSince1970: item.dueDate)
        
        if calendar.isDateInToday(dueDate) {
            return "Today at " + Date(timeIntervalSince1970: item.dueDate).formatted(date: .omitted, time: .shortened)
        } else if calendar.isDateInTomorrow(dueDate) {
            return "Tomorrow at " + Date(timeIntervalSince1970: item.dueDate).formatted(date: .omitted, time: .shortened)
        } else if calendar.isDateInYesterday(dueDate) {
            return "Yesterday at " + Date(timeIntervalSince1970: item.dueDate).formatted(date: .omitted, time: .shortened)
        } else {
            return Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened)
        }
    }
    
    
    func toggleCompletionStatus(item: TaskItem){
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
