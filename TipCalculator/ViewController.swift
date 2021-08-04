//
//  ViewController.swift
//  TipCalculator
//
//  Created by Will Couture on 8/1/21.
//

import UIKit

var currencyIndex = 0

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var taxCurrentPercentageLabel: UILabel!
    
    @IBOutlet weak var taxTotalLabel: UILabel!
    
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var tipControl: UISlider!
    
    @IBOutlet weak var tipCurrentPercentageLabel: UILabel!
    
    var total = 0.0
    var bill = 0.0
    var tip = 0.0
    var currency = "$"
    
    var tipPercentage: Float = 10.0
    var taxPercentage: Float = 5.0
    var tax: Double = 0.0
    
    let currencies = ["$", "€", "£", "¥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.value = tipPercentage
        taxPercentageSlider.value = taxPercentage
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UpdateUI()
    }
    
    @IBAction func CalculateTip(_ sender: Any) {
        bill = Double(billAmountTextField.text!) ?? 0
        taxPercentage = taxPercentageSlider.value
        tax = bill * Double(taxPercentage) / 100.0
        bill = bill + tax
        
        tipPercentage = tipControl.value
        tip = bill * Double(tipPercentage) / 100.0
        total = bill + tip
        
        UpdateUI()
    }
    
    func UpdateUI() {
        
        tipCurrentPercentageLabel.text = String(format:"%.2f", tipPercentage) + "%"
        
        tipAmountLabel.text = currencies[currencyIndex] + String(format:"%.2f", tip)
        taxCurrentPercentageLabel.text = String(format: "%.2f", taxPercentage) + "%"
        taxTotalLabel.text = currencies[currencyIndex] + String(format:"%.2f", tax)
        
        totalLabel.text = currencies[currencyIndex] + String(format: "%.2f", total)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        billAmountTextField.resignFirstResponder()
    }
}

class Currency : UIViewController{
    
    @IBOutlet weak var CurrencyControl: UISegmentedControl!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    @IBAction func UpdateCurrency(_ sender: Any) {
        currencyIndex = CurrencyControl.selectedSegmentIndex
    }
}

