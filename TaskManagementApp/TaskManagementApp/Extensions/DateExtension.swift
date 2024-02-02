//
//  DateExtension.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import Foundation


extension Date{
    
    func format (_ format : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    //checking whether is date is today
    var isToday : Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    struct weekDay : Identifiable {
        var id = UUID().uuidString
        var date : Date
    //    var day : String
    }
    
    func fetchWeek(_ date : Date = .init()) -> [weekDay]{
        let calender = Calendar.current
        let startDay = calender.startOfDay(for: date)
        
        var Week: [weekDay]  = []
        let weekDate = calender.dateInterval(of: .weekOfMonth, for: startDay)
        guard let startweek = weekDate?.start else{
            return []
        }
        
        //Iterating to get full week
        (0...7).forEach { index in
            if let weekDay = calender.date(byAdding: .day, value: index, to: startweek){
                Week.append(.init(date: weekDay))
            }
        }
        return Week
    }
    
    //creating next week based on last date
    func createNextWeek () -> [weekDay]{
        let calendar = Calendar.current
        let startOfLastDay = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDay) else{
            return []
        }
        return fetchWeek(nextDate)
        
    }
    
    //creating previous week based on first date
    func createPreviousWeek () -> [weekDay]{
        let calendar = Calendar.current
        let startOffirstDay = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOffirstDay) else{
            return []
        }
         
        return fetchWeek(previousDate)
        
    }
    
    
}
