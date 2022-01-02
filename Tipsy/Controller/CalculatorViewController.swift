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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tip = 0.0
        
        if zeroPctButton.isSelected {
            tip = 0.0
        } else if tenPctButton.isSelected {
            tip = 0.1
        } else if twentyPctButton.isSelected {
            tip = 0.2
        }
        
        let totalPerPerson = calculateTotalPerPerson(billTotal: billTextField.text ?? "", tip: tip, splitBetween: splitNumberLabel.text!)
        print("Total da conta: \(billTextField.text ?? "")")
        print("Selecione a gorjeta: \(tip)")
        print("Dividido entre \(splitNumberLabel.text!) pessoas.")
        print("Total por pessoa: \(totalPerPerson)")
        
        let data: [String : Any] = ["numberOfPeople": splitNumberLabel.text!, "tipPercentage": tip, "totalPerPerson": totalPerPerson]
        
        performSegue(withIdentifier: "ResultsViewController", sender: data)
    }
    
    private func calculateTotalPerPerson(billTotal: String, tip: Double, splitBetween: String) -> String {
        
        let billTotal = Double(billTotal)!
        let splitBetween = Double(splitBetween)!
        
        return String(format: "%.2f", (billTotal + (billTotal * tip)) / splitBetween)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController" {
            let resultado = segue.destination as! ResultsViewController
            let data = sender as! [String : Any]
            
            resultado.totalPerPerson = data["totalPerPerson"] as? String
            resultado.numberOfPeople = data["numberOfPeople"] as? String
            resultado.tipPercentage = data["tipPercentage"] as? Double
        }
    }
}

