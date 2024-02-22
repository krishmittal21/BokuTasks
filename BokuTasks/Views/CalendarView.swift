//
//  CalenderView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct CalendarView: View {
    @StateObject var viewModel: CalendarViewViewModel
    @FirestoreQuery var items: [TaskItem]
    @State private var selectedDate = Date()
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        self._viewModel = StateObject(wrappedValue: CalendarViewViewModel(userId: userId))
    }
    
    var body: some View {
        VStack{
            VStack {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
            }
            tasks
        }
    }
    
    @ViewBuilder
    var tasks: some View {
        let filteredItems = items.filter { task in
                    let taskDate = Date(timeIntervalSince1970: task.dueDate)
                    return Calendar.current.isDate(taskDate, equalTo: selectedDate, toGranularity: .day)
        }.sorted(by: { $0.dueDate < $1.dueDate })
        ZStack{
            List(filteredItems) { item in
                TaskListItemView(item: item)
            }
            .listStyle(PlainListStyle())
            .cornerRadius(10)
        }
    }
}

#Preview {
    CalendarView(userId: "HCbFqqujIRZXoDFGBGvhdIpVDpM2")
}
