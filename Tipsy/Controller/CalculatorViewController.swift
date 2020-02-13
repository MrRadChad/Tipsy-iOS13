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
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!

    var tipAmount = 0.10
    var numberOfPeople = 2
    var subtotal = 0.0
    var finalBill = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        deselectAll()
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tipAmount = buttonTitleAsNumber / 100
    }
    func deselectAll(){
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = billTextField.text!
        
        if billAmount != "" {
            subtotal = Double(billAmount)!
            let result = subtotal * (1 + tipAmount) / Double(numberOfPeople)
            finalBill = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "resultsSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.priceToPay = finalBill
            destinationVC.tipAmount = Int(tipAmount * 100)
        }
    }

}

