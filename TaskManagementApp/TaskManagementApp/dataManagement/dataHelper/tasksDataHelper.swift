//
//  tasksDataHelper.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//

import Foundation
import CoreData


class tasksDataHelper : ObservableObject {
    
    static let shared = tasksDataHelper()
    
    func createTasks (_ taksName: String, _ note: String, _ createdDate: Date, _ dueDate: Date, _ isCompleted : Bool, _ setAlram: Bool, _ alertValue: String, _ repeatValue : String, _ urlAttachment : String, _ themeName : String ,_ viewContext : NSManagedObjectContext, completionHandler : @escaping (_ success : Bool)-> Void) {
        
        let taskObject = Tasks_data(context: viewContext)
        taskObject.taskaname = taksName
        taskObject.note = note
        taskObject.createddate = createdDate
        taskObject.duedate = dueDate
        taskObject.iscompletd = isCompleted
        taskObject.setalarm = setAlram
        taskObject.alertvalue = alertValue
        taskObject.repeatedvalue = repeatValue
        taskObject.urlattachement = URL(string: urlAttachment)
        taskObject.themefortask = themeName
        
        do{
            try viewContext.save()
            completionHandler(true)
        }catch{
            completionHandler(false)
        }
    }
    
    func updateTasks (_ taskObject : Tasks_data, _ taksName: String,  _ note: String, _ createdDate: Date, _ dueDate: Date, _ isCompleted : Bool, _ setAlram: Bool, _ alertValue: String, _ repeatValue : String, _ urlAttachment : String, _ viewContext : NSManagedObjectContext, completionHandler : @escaping (_ success : Bool)-> Void) {
        
        taskObject.taskaname = taksName
        taskObject.note = note
        taskObject.createddate = createdDate
        taskObject.duedate = dueDate
        taskObject.iscompletd = isCompleted
        taskObject.setalarm = setAlram
        taskObject.alertvalue = alertValue
        taskObject.repeatedvalue = repeatValue
        taskObject.urlattachement = URL(string: urlAttachment)
        
        do{
            try viewContext.save()
            completionHandler(true)
        }catch{
            completionHandler(false)
        }
    }
    
    func deleteTasks (_ task : Tasks_data, _ context : NSManagedObjectContext, completionHandler : @escaping (_ success : Bool)-> Void) {
        context.delete(task)
        do {
            try context.save()
            completionHandler(true)
        }catch {
            completionHandler(false)
        }
        
    }
    
    func markAsComplete (_ event : Tasks_data, isCompleted : Bool, _ context: NSManagedObjectContext, completionHandler : @escaping(_ success : Bool)->Void){
        
        event.iscompletd = isCompleted
        do{
            try context.save()
            completionHandler(true)
        }catch{
            completionHandler(false)
        }
    }
}
