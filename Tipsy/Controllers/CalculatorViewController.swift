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
    
    var pctValue = 0.1
    var numberOfPeople = 2.00
    var billToDouble = 0.00
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        billTextField.endEditing(true)
        
        if (sender.currentTitle
            == "0%") {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            pctValue = 0.0
        }
        
        else if (sender.currentTitle
                 == "10%") {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            pctValue = 0.1
        }
        
        else if (sender.currentTitle
                 == "20%") {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            pctValue = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Double(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billToDouble = Double(billTextField.text!)!
        var tipSplit = String(format: "%.2f", ((billToDouble * (1 + pctValue)) / numberOfPeople))
        print(tipSplit)
    }

}

