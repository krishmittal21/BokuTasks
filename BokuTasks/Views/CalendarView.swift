//
//  CalenderView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel: CalendarViewViewModel
    
    
    init(userId: String){
        self._viewModel = StateObject(wrappedValue: CalendarViewViewModel(userId: userId))
    }
    
    var body: some View {
        VStack{
            VStack {
                DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
            }
            tasks
        }
        .padding()
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    var tasks: some View {
        let filteredItems = viewModel.filterTasks(forDate: viewModel.selectedDate)
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
