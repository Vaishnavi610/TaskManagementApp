//
//  tasksViewModel.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//

import Foundation
import SwiftUI
import CoreData

class tasksViewModel : ObservableObject {
    
    let viewContext = PersistenceController.shared.viewContext
    
    @State var themeColorArray : [themeColor] = [.black, .blue, .red, .brown, .pink, .skyBlue, .purple]
    
    @Published var userTasksData : [Tasks_data] = []
    
    init(){
        fetchData ()
    }
    
    func fetchData (){
        let request = NSFetchRequest<Tasks_data>(entityName: "Tasks_data")
        do{
            userTasksData = try viewContext.fetch(request)
        }catch{
            
        }
    }
    
    func crateTasks (taksName: String,  note: String,  createdDate: Date,  dueDate: Date,  isCompleted : Bool,  setAlram: Bool, alertValue: String, repeatValue : String, urlAttachment : String, selecteTheme : String ,completionHandler : @escaping (_ success : Bool)-> Void){
        tasksDataHelper.shared.createTasks(taksName, note, createdDate, dueDate, isCompleted, setAlram, alertValue, repeatValue, urlAttachment, selecteTheme, viewContext) { success in
            if success{
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
    }
    
    func updateIsComplete (_ task : Tasks_data, isCompleted : Bool,completionHandler : @escaping (_ success : Bool)-> Void){
        tasksDataHelper.shared.markAsComplete(task, isCompleted: isCompleted, viewContext) { success in
            if success {
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
    }
    
    func deleteTask (_ task : Tasks_data,completionHandler : @escaping (_ success : Bool)-> Void) {
        tasksDataHelper.shared.deleteTasks(task, viewContext) { success in
            if success{
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
    }
    
    
}
