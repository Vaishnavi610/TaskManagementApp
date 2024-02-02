//
//  offsetKey.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import Foundation
import SwiftUI


struct OffsetKey: PreferenceKey {
    
    static let defaultValue : CGFloat = 0
    static func reduce(value : inout CGFloat, nextValue : () -> CGFloat ){
        value = nextValue()
    }
}
