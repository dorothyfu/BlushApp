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
    
    // Changes picker text color to white
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let titleData = pickerData[row]
//        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
//        return myTitle
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalUIVariables.backgroundColorPink
        timePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
}
