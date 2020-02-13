//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by James Frazee on 2/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var priceToPay = "0.00"
    var tipAmount = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = priceToPay
        settingsLabel.text = "Split between \(split) people, with \(tipAmount)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
