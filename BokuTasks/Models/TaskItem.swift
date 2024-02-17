//
//  TaskItem.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation

struct TaskItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
