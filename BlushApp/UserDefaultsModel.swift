//
//  UserDefaultsModel.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-21.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import Foundation

enum UserDefaultKeys: String {
    case notifyHour
    case notifyMinute
    case passedDays
}

extension UserDefaults {
    func setNotifyHour(value: Int) {
        set(value, forKey: UserDefaultKeys.notifyHour.rawValue)
    }
    
    func setNotifyMinute(value: Int) {
        set(value, forKey: UserDefaultKeys.notifyMinute.rawValue)
    }
    
    func getNotifyHour() -> Int {
        return integer(forKey: UserDefaultKeys.notifyHour.rawValue)
    }
    
    func getNotifyMinute() -> Int {
        return integer(forKey: UserDefaultKeys.notifyMinute.rawValue)
    }
    
    func setPassedDays(value: Int) {
        set(value, forKey: UserDefaultKeys.passedDays.rawValue)
    }
    
    func getPassedDays() -> Int {
        return integer(forKey: UserDefaultKeys.passedDays.rawValue)
    }
}

