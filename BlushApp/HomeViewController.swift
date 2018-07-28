//
//  HomeViewController.swift
//  BlushApp
//
//  Created by Dorothy Fu on 2018-07-22.
//  Copyright © 2018 Dorothy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var numDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var pillsLeftLabel: allLabels!
    @IBOutlet weak var numPillsLeftLabel: allLabels!
    
    @IBOutlet weak var homeNavBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numPillsLeftLabel.text = displayNumberHome()
        pillsLeftLabel.text = displayTextHome()
        numDayLabel.text = String(UserDefaults.standard.getCurrentDay())
        self.view.backgroundColor = GlobalUIVariables.pinkThree
    }
    
}
