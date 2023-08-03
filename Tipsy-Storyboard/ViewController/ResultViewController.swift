//
//  ResultViewController.swift
//  Tipsy-Storyboard
//
//  Created by iOS - Developer on 03.08.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingLabel: UILabel!
    @IBOutlet var buttonRecalculate: UIButton!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonRecalculate.layer.cornerRadius = 10
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculateLabel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
