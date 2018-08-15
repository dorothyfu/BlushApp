//
//  DayPickerViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-21.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit
import UserNotifications

class DayPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickedDaysString = "-1"


    @IBOutlet weak var PickDayLabel: allLabels!
    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var PickDayButton: OnBoardingButton!
    
    @IBAction func onClickPickDayButton(_ sender: Any) {
        let pickedDaysStringToInt:Int? = Int(pickedDaysString)
        UserDefaults.standard.setCurrentDay(value: pickedDaysStringToInt!)
        print(String(UserDefaults.standard.getCurrentDay()))
        
//        // Set up notifications
//        let notificationSettings = UIUserNotificationSettings(
//            types: [.badge, .sound, .alert], categories: nil)
//        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
//        scheduleNotification()
//        
//        UserDefaults.didPassOnboarding()
//        UserDefaults.standard.synchronize()
    }

    // PickerView set up
    let pickerData = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        pickedDaysString = pickerData[row]
        PickDayButton.isEnabled = true
    }
    
    // Changes picker text color to white
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
        return myTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalUIVariables.backgroundColorPink
        dayPicker.delegate = self
        dayPicker.dataSource = self
    }

}

