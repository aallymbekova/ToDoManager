//
//  StorageManager.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 17/9/24.
//

import UIKit
import CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    
    private override init() {}
    
    private var appDelegate: AppDelegate = {
        UIApplication.shared.delegate as! AppDelegate
        
    }()
    
    private var context: NSManagedObjectContext {
        appDelegate.persistenContainer.viewContext
    }
    
    public func createTask(_ title: String, completion: @escaping (Tasks?) -> Void) {
        guard  let tasksEntityDescription = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { return }
        let tasks = Tasks(entity: tasksEntityDescription, insertInto: context)
        
        tasks.title = title
        appDelegate.saveContext()
        
        completion(tasks)
    }
    
    public func fetchTasks(completion: @escaping ([Tasks]) -> Void) {
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            let coreDataResults = try context.fetch(fetchRequest)
            completion(coreDataResults)
        } catch {
            print("Failed to fetch Core Data: \(error.localizedDescription)")
            completion([])
        }
    }
    
    public func fetchTask(with title: String) -> Tasks? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            guard let tasks = try? context.fetch(fetchRequest) as? [Tasks] else { return nil }
            return tasks.first(where: { $0.title == title })
        }
    }
    
    public func updateTask(with title: String, date: Date, completed: Bool) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            guard let tasks = try? context.fetch(fetchRequest) as? [Tasks] ,
            let task = tasks.first(where: { $0.title == title }) else { return }
            task.title = title
            task.date = date
            task.completed = completed
        }
        
        appDelegate.saveContext()
    }
    
    public func deleteAllTasks() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
            let tasks = try? context.fetch(fetchRequest) as? [Tasks]
            tasks?.forEach{ context.delete($0) }
        }
        
        appDelegate.saveContext()
    }
    
    public func deleteTask(with title: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
        do {
           guard let tasks = try? context.fetch(fetchRequest) as? [Tasks],
                 let task = tasks.first(where: {$0.title == title}) else { return }
            context.delete(task)
        }
        
        appDelegate.saveContext()
    }
}
