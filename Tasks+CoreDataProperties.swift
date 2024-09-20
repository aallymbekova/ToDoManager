//
//  Tasks+CoreDataProperties.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 16/9/24.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?

}

extension Tasks : Identifiable {

}
