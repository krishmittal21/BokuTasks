//
//  BTSettingsButton.swift
//  BokuTasks
//
//  Created by Krish Mittal on 23/02/24.
//

import SwiftUI

struct BTSettingsButton<Destination: View>: View {
    let title: String
    let destination: Destination
    let icon: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack(alignment: .leading){
                                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 40)
                                
                HStack{
                                        
                    Image(systemName: icon)
                        .foregroundStyle(Color.primaryColor)
                                    
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.system(size: 15))
                                        
                }
                .padding(.leading, 8)
                
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        
    }
}
