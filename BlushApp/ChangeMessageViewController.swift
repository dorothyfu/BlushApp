//
//  ChangeMessageViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-08-21.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit


class ChangeMessageViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func onMessageFieldChanged(_ sender: Any) {
        if messageTextField.text == "" {
            self.saveButton.isEnabled = false
        }else{
            self.saveButton.isEnabled = true
        }
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        let message = messageTextField.text
        UserDefaults.standard.setCustomMessage(message: message!)
        UserDefaults.standard.setMessageToUse(key: "custom")
        
        // Set up notifications
        let notificationSettings = UIUserNotificationSettings(
            types: [.badge, .sound, .alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        scheduleNotification()
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        
    }
    
    @IBAction func onResetClicked(_ sender: Any) {
        UserDefaults.standard.setMessageToUse(key: "default")
        UserDefaults.standard.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.placeholder = UserDefaultKeys.defaultMessage.rawValue
    }
    
}
