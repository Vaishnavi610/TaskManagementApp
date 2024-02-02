//
//  viewExtension.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import Foundation
import SwiftUI

extension View{
    
    func isSameDate(_ date : Date , _ secondDate : Date) -> Bool {
        return Calendar.current.isDate(date, inSameDayAs: secondDate)
    }
    
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
    }
}

