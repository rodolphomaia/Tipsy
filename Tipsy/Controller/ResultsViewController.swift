//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rodolpho Maia on 17/04/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson: String!
    var numberOfPeople: String!
    var tipPercentage: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = "R$" + self.totalPerPerson
        settingsLabel.text = "Dividido entre \(self.numberOfPeople!) pessoas, com \(String(format: "%.0f", self.tipPercentage * 100))% de gorjeta."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
