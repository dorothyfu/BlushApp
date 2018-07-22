//
//  TimePickerViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-21.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalUIVariables.backgroundColorPink
    }
    
}
