//
//  ResultViewController.swift
//  Tipsy-Storyboard
//
//  Created by iOS - Developer on 03.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingLabel: UILabel!
    @IBOutlet var recalculateButton: UIButton!
    
    private var result = "0.0"
    private var tip = 10
    private var split = 2
    
    func configure(result: String, tip: Int, split: Int) {
    self.result = result
    self.tip = tip
    self.split = split
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = 10
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculateLabel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
