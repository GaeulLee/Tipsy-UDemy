//
//  Calculator.swift
//  Tipsy
//
//  Created by 이가을 on 4/29/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    var selectedTip = "10%"
    var peopleToSplit = 2.0
    var totalBillText = "0.0"
    
    func calculateBill() -> String {
        let filterdTipStr = selectedTip.filter { $0.isNumber }
        
        let tipToPct = Double(filterdTipStr)! / 100.0
        let totalBill = Double(totalBillText)!
        let result = round(((totalBill + (totalBill * tipToPct)) / peopleToSplit) * 100)
        let formatedResult = String(format: "%.2f", result / 100)
        
        return formatedResult
    }
}
