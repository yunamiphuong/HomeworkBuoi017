//
//  ViewController.swift
//  pocketCalculator
//
//  Created by Apple on 2/19/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var resetACButton: UIButton!
    
    @IBOutlet weak var buttonDivide: UIButton!
    
    @IBOutlet weak var buttonMultiply: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonResult: UIButton!
    
    var currentNumber: Int = 0
    var previousNumber: Int = 0
    var nextNumber: Int = 0
    var currentResult: Int = 0
    
    //input number into an array [string] -> join all elements into an Int
    var inputNumber : Int = 0
    var inputArr = [String]()
    
    enum mathOperation {
        case divide
        case multiply
        case minus
        case plus
    }
    
    var currentMathOperation: mathOperation = .divide
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.text = "0"
        
        
    }
    
    func doMath() {
        
        switch currentMathOperation {
        case .divide:
            currentResult = previousNumber / currentNumber
        case .multiply:
            currentResult = previousNumber * currentNumber
        case .minus:
            currentResult = previousNumber - currentNumber
        case .plus:
            currentResult = previousNumber + currentNumber
        }

        
    }
    
    @IBAction func pressNumbers(_ sender: UIButton) {
        inputNumber = sender.tag
        inputArr.append(String(inputNumber))
        print(inputArr)
        
       let newCurrentNumber = inputArr.joined(separator:"")
        
        currentNumber = Int(newCurrentNumber) ?? 0
        
        currentResult = currentNumber
        print(currentNumber)
        labelResult.text = "\(currentNumber)"
doMath()
        
    }
    
    
    @IBAction func pressDivide(_ sender: Any) {
        currentMathOperation = .divide
        previousNumber = currentNumber
        inputArr.removeAll()

//        labelResult.text = "\(currentResult)"
        print(currentResult, previousNumber, currentNumber, currentMathOperation)
    }
    
    
    @IBAction func pressMultiply(_ sender: Any) {
        currentMathOperation = .multiply
        previousNumber = currentNumber
                inputArr.removeAll()
//        labelResult.text = "\(currentResult)"
        
    }
    
    @IBAction func pressMinus(_ sender: Any) {
        currentMathOperation = .minus
        previousNumber = currentNumber
                inputArr.removeAll()
//        labelResult.text = "\(currentResult)"
    }
    
    
    @IBAction func pressPlus(_ sender: Any) {
        currentMathOperation = .plus
        previousNumber = currentNumber
                inputArr.removeAll()
//        labelResult.text = "\(currentResult)"
    }
    
    
    @IBAction func pressResult(_ sender: Any) {
                inputArr.removeAll()
        labelResult.text = "\(currentResult)"
        print(currentResult, previousNumber, currentNumber, currentMathOperation)
    }
    
    
    @IBAction func pressAC(_ sender: Any) {
        currentResult = 0
        previousNumber = 0
        inputArr.removeAll()
        labelResult.text = "\(currentResult)"
    }
    
}

