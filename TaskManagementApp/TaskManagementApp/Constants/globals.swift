//
//  globals.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//

import Foundation
import SwiftUI



var repeatValueArray = ["Never", "Every Day", "Every Week", "Every Month", "Every year"]

var alertValueArray = ["None", "At time of event", "5 minutes of before", "10 times before ", "15 minutes before","30 minutes before" ,"1 hour before", "2 days before", "1 week before"]

func setColor (_ themeName : String) -> Color {
    if themeName == "pink" {
        return .pinkLabel
    }else  if themeName == "Black" {
        return .blackLabel
    }else  if themeName == "blue" {
        return .blueLabel
    }else  if themeName == "brown" {
        return .brownLabel
    }else  if themeName == "purple" {
        return .purpleLabel
    }else  if themeName == "red" {
        return .redLabel
    }else  if themeName == "skyBlue" {
        return .skyBlueLabel
    }else{
        return .gray
    }
}
