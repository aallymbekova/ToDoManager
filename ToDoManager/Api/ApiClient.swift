//
//  ApiClient.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 11/9/24.
//

import Foundation

final class ApiClient {
 
    func fetchTasks(completion: @escaping ([ToDos]?) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/todos") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка запроса")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data")
                completion(nil)
                return
            }
            
            do {
                let tasks = try JSONDecoder().decode(TasksData.self, from: data)
                completion(tasks.todos)
            } catch let jsonError {
                print("Ошибка декодирования JSON: \(jsonError)")
                completion(nil)
            }
        }
        task.resume()
    }
}

struct TasksData: Decodable {
    let todos: [ToDos]
}

struct ToDos: Decodable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

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
