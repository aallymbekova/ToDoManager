//
//  ToDos.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 21/9/24.
//

import Foundation

struct ToDos: Decodable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
