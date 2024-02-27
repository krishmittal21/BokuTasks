//
//  CalendarViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class CalendarViewViewModel: ObservableObject {
    @Published var items: [TaskItem] = []
    @Published var selectedDate = Date()
    private let userId: String
    init(userId: String) {
        self.userId = userId
        fetchTasks()
    }
    func fetchTasks() {
        let query = Firestore.firestore().collection("users/\(userId)/tasks")
        query.addSnapshotListener { result, error in
            guard let documents = result?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            self.items = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: TaskItem.self)
            }
        }
    }
    
    func filterTasks(forDate date: Date) -> [TaskItem] {
        return items.filter { task in
            let taskDate = Date(timeIntervalSince1970: task.dueDate)
            return Calendar.current.isDate(taskDate, equalTo: date, toGranularity: .day)
        }.sorted(by: { $0.dueDate < $1.dueDate })
    }
    
    
}
