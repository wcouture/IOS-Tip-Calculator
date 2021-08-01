//
//  ViewController.swift
//  TipCalculator
//
//  Created by Will Couture on 8/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var taxCurrentPercentageLabel: UILabel!
    
    @IBOutlet weak var taxTotalLabel: UILabel!
    
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var tipControl: UISlider!
    
    @IBOutlet weak var tipCurrentPercentageLabel: UILabel!
    
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    var total = 0.0
    var bill = 0.0
    var tip = 0.0
    var currency = "$"
    
    let currencies = ["$", "€", "£", "¥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateCurrency(_ sender: Any) {
        currency = currencies[currencyControl.selectedSegmentIndex]
        UpdateUI(self)
    }
    
    @IBAction func UpdateUI(_ sender: Any) {
        bill = Double(billAmountTextField.text!) ?? 0
        let taxPercentage = Double(taxPercentageSlider.value)
        let tax = bill * taxPercentage / 100.0
        bill = bill + tax
        
        let tipPercentage = tipControl.value
        tip = bill * Double(tipPercentage) / 100.0
        total = bill + tip
        
        tipCurrentPercentageLabel.text = String(format:"%.2f", tipPercentage) + "%"
        
        tipAmountLabel.text = currency + String(format:"%.2f", tip)
        taxCurrentPercentageLabel.text = String(format: "%.2f", taxPercentage) + "%"
        taxTotalLabel.text = currency + String(format:"%.2f", tax)
        
        totalLabel.text = currency + String(format: "%.2f", total)
    }
}

