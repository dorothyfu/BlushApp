//
//  ChangeTimeViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-08-19.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit

class ChangeTimeViewController: UIViewController {
    var hour = -1
    var minute = -1
    
    @IBOutlet weak var timePickerLabel: allLabels!
    
    @IBOutlet weak var timePickerNextButton: UIButton!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func onTimePickerSelected(_ sender: Any) {
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        hour = components.hour!
        minute = components.minute!
        timePickerNextButton.isEnabled = true
    }
    
    @IBAction func onTimeNextClicked(_ sender: Any) {
        UserDefaults.standard.setNotifyHour(value: hour)
        UserDefaults.standard.setNotifyMinute(value: minute)
        // Set up notifications
        let notificationSettings = UIUserNotificationSettings(
            types: [.badge, .sound, .alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        scheduleNotification()
        
        UserDefaults.didPassOnboarding()
        UserDefaults.standard.synchronize()
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalUIVariables.settingsBackgroundColorPink
        timePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
}
