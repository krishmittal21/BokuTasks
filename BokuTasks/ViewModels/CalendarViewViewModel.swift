//
//  CalendarViewViewModel.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import Foundation
import FirebaseFirestore

class CalendarViewViewModel: ObservableObject {
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}
