//
//  Tasks_data+CoreDataProperties.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//
//

import Foundation
import CoreData


extension Tasks_data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks_data> {
        return NSFetchRequest<Tasks_data>(entityName: "Tasks_data")
    }

    @NSManaged public var taskaname: String?
    @NSManaged public var note: String?
    @NSManaged public var createddate: Date?
    @NSManaged public var duedate: Date?
    @NSManaged public var repeatedvalue: String?
    @NSManaged public var iscompletd: Bool
    @NSManaged public var themefortask: String?
    @NSManaged public var setalarm: Bool
    @NSManaged public var alertvalue: String?
    @NSManaged public var urlattachement: URL?

}

extension Tasks_data : Identifiable {

}
