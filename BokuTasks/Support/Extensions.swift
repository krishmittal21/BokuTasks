//
//  Extensions.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

extension Color {
    static let primaryColor = Color("AccentColor")
    static let backgroundColor = Color("BackgroundColor")
}

extension Encodable {
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
