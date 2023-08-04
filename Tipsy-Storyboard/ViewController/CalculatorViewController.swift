//
//  ViewController.swift
//  Tipsy-Storyboard
//
//  Created by iOS - Developer on 02.08.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    @IBOutlet var buttonCalculate: UIButton!
    
    private var tip = 0.10
    private var numberOfPeople = 2
    private var billTotal = 0.0
    private var finalResult = "0.0"
    
    override func loadView() {
        super.loadView()
        buttonLayer()
    }
    
    private func buttonLayer() {
        buttonCalculate.layer.cornerRadius = 20
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Deselect all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(numberOfPeople)
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.1f", result)
        }
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.configure(result: finalResult, tip: Int(tip * 100), split: numberOfPeople)
        }
    }
}
