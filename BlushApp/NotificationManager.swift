//
//  NotificationManager.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-22.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import Foundation
import UserNotifications


func scheduleNotification() {
    let notifyHour = UserDefaults.standard.getNotifyHour()
    let notifyMinute = UserDefaults.standard.getNotifyMinute()
    let cycleDay = UserDefaults.standard.getCurrentDay()
    // first, you declare the content of the notification:
    let content = UNMutableNotificationContent()
    
    if UserDefaults.standard.getMessageToUse() == "default" {
        content.body = "It's time to take your pill!"
    } else {
        content.body = UserDefaults.standard.getCustomMessage()
    }
    
    // now, you should declare the UNCalendarNotificationTrigger instance,
    // but before that, you'd need to describe what's the date matching for firing it:
    
    var date = DateComponents()
    date.hour = notifyHour
    date.minute = notifyMinute
    
    if cycleDay < 22 {
        // declaring the trigger
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
    
        // creating a request and add it to the notification center
        let request = UNNotificationRequest(identifier: "notification-identifier", content: content, trigger: calendarTrigger)
        UNUserNotificationCenter.current().add(request)
    } else {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
