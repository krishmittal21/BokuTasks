//
//  BTAuthButton.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

struct BTAuthButton: View {
    let title: String
    let background: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(background)
                    .frame(width: 150, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                Text(title)
                    .foregroundStyle(textColor)
                    .bold()
                    .font(.system(size: 20))
                    
            }
        }
    }
}
