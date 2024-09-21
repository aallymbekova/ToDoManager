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
