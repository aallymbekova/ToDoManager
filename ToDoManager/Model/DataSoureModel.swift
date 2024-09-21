//
//  DataSoureModel.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 21/9/24.
//

import Foundation

struct DataSoureModel {
    var title: String
    var completed: Bool
    
    init(todo: ToDos) {
        title = todo.todo
        completed = todo.completed
    }
    
    init(coreDataTasks: Tasks) {
        self.title = coreDataTasks.title ?? "No Task"
        self.completed = false
    }
}
