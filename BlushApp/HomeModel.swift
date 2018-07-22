//
//  HomeModel.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-22.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import Foundation

let totalDays = 28
let pillTotalDays = 21
let emptyTotalDays = 7

let day = UserDefaults.standard.getCurrentDay()
let notifyHour = UserDefaults.standard.getNotifyHour()
let notifyMinute = UserDefaults.standard.getNotifyMinute()
let date = Date()
let calendar = Calendar.current
let currentHour = calendar.component(.hour, from: date)
let currentMinute = calendar.component(.minute, from: date)

func notifiedToday() -> Bool {
    if currentHour < notifyHour {
        return false
    } else if currentHour == notifyHour && currentMinute < notifyMinute {
        return false
    } else {
        return true
    }
}

func displayNumberHome() -> String {
    
    var stringToBeReturned = ""
    
    if day < pillTotalDays {
        if notifiedToday() {
            stringToBeReturned = String(pillTotalDays - day - 1)
        } else {
            stringToBeReturned = String(pillTotalDays - day)
        }
    } else if day == pillTotalDays {
        if notifiedToday() {
            // Start of emptypill
            stringToBeReturned = String(totalDays - day)
        } else {
            stringToBeReturned = "1"
        }
    } else if day < totalDays {
        if notifiedToday() {
            stringToBeReturned = String(totalDays - day - 1)
        } else {
            stringToBeReturned = String(totalDays - day)
        }
    } else {
        if notifiedToday() {
            stringToBeReturned = "Should not have occured"
        } else {
            stringToBeReturned = "1"
        }
    }
    return stringToBeReturned
}

func displayTextHome() -> String {
    let singleOnPills = "Pill Left"
    let onPills = "Pills Left"
    let singleOnEmpty = "Pill Free Day Left"
    let onEmpty = "Pill Free Days Left"
    var stringToBeReturned = ""
    
    if day < pillTotalDays {
        stringToBeReturned = onPills
    } else if day == pillTotalDays {
        if currentHour <= notifyHour && currentMinute < notifyMinute {
            stringToBeReturned = singleOnPills
        } else if (currentHour <= notifyHour && currentMinute >= notifyMinute) || currentHour > notifyHour {
            stringToBeReturned = onEmpty
        }
    } else if day < totalDays {
        stringToBeReturned = onEmpty
    } else {
        if currentHour <= notifyHour && currentMinute < notifyMinute {
            stringToBeReturned = singleOnEmpty
        } else {
            stringToBeReturned = onPills
        }
    }
    return stringToBeReturned
}
