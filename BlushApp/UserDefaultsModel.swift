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
    case currentDay
    case hasBeenLaunchedBeforeFlag
}

extension UserDefaults {
    fileprivate class func boolForKey(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    fileprivate class func setValue(value: Bool, key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

extension UserDefaults {
    private static let didPassOnboardingKey = "didPassOnboarding"
    
    class func hasPassedOnboarding() -> Bool {
        return UserDefaults.boolForKey(key: UserDefaults.didPassOnboardingKey)
    }
    
    class func didPassOnboarding() {
        UserDefaults.setValue(value: true, key: UserDefaults.didPassOnboardingKey)
    }
    
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
    
    func setCurrentDay(value: Int) {
        set(value, forKey: UserDefaultKeys.currentDay.rawValue)
    }
    
    func getCurrentDay() -> Int {
        return integer(forKey: UserDefaultKeys.currentDay.rawValue)
    }
}

