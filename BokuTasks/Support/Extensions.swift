//
//  Extensions.swift
//  BokuTasks
//
//  Created by Krish Mittal on 16/02/24.
//

import SwiftUI

extension Color {
    static let newPrimary = Color("PrimaryColor")
    static let newSecondary = Color("SecondaryColor")
    static let Gradient1 = Color("Gradient1")
    static let Gradient2 = Color("Gradient2")
    static let Gradient3 = Color("Gradient3")
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
