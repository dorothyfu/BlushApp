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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayLabel.text = "Day"
        numPillsLeftLabel.text = displayNumberHome()
        pillsLeftLabel.text = displayTextHome()
        numDayLabel.text = String(UserDefaults.standard.getCurrentDay())
        self.view.backgroundColor = GlobalUIVariables.pinkThree
    }
    
}
