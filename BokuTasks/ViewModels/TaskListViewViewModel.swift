//
//  TaskListViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation

class TaskListViewViewModel: ObservableObject {
    @Published var showingNewItem = false
    init() {}
    
    func delete(id: String)
}
