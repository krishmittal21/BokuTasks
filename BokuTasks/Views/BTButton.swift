//
//  BTButton.swift
//  BokuTasks
//
//  Created by Krish Mittal on 17/02/24.
//

import SwiftUI

struct BTButton: View {
    let action: () -> Void
    let backgroundColor: Color
    let text: String
    let textColor: Color
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                    .frame(width: 320, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    )
                Text(text)
                    .foregroundStyle(textColor)
                    .bold()
                    .font(.system(size: 20))
            }
        }

    }
}
