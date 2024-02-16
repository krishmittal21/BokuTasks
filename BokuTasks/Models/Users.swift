//
//  Users.swift
//  BokuTasks
//
//  Created by Krish Mittal on 15/02/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
