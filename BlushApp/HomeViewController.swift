//
//  HomeViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-22.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    @IBOutlet weak var numDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var pillsLeftLabel: UILabel!
    @IBOutlet weak var numPillsLeftLabel: UILabel!
    @IBOutlet weak var calendarIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabel.text = "Day" + " " + String(UserDefaults.standard.getCurrentDay())
        pillsLeftLabel.text = displayNumberHome() + " " + displayTextHome()
        self.view.backgroundColor = GlobalUIVariables.homePink
        let calendarImage = UIImage(named: "calendarIcon.png")
        calendarIcon.image = calendarImage
    }
    
}
