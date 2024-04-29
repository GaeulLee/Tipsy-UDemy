//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var calculator = Calculator()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        calculator.selectedTip = sender.currentTitle!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = sender.value
        
        splitNumberLabel.text = String(Int(stepperValue))
        calculator.peopleToSplit = stepperValue
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if billTextField.text == "" { return }
        calculator.totalBillText = billTextField.text ?? "0.0"
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bill = calculator.calculateBill()
            destinationVC.people = String(Int(calculator.peopleToSplit))
            destinationVC.tip = calculator.selectedTip
        }
    }
}

