//
//  RegisterView.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        Text("Sign Up")
            .font(.system(size: 35, weight: .medium, design: .rounded))
            .padding(.top, 50)
            .ignoresSafeArea()
        Spacer()
    }
}

#Preview {
    RegisterView()
}
