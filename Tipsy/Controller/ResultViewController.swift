//
//  ResultViewController.swift
//  Tipsy
//
//  Created by 이가을 on 4/26/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var bill: String?
    var people: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = bill
        settingLabel.text = "Split between \(people!) people, with \(tip!) tip."
    }
    

    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
