//
//  ViewController.swift
//  Calculator
//
//  Created by ARY@N  on 10/09/2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {fatalError("Can't convert display label text to a double")}
            return number
        }
        set {
             displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
           
            if let result = calculator.calculate(symbol: calcMethod) {
            displayValue = result
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numvalue = sender.currentTitle {
            if isFinishedTyping {
               displayLabel.text = numvalue
                isFinishedTyping = false
            }
            else {
                
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
                
                displayLabel.text = displayLabel.text! + numvalue
            }
            
        }
    
    }

}

