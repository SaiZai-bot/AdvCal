//
//  ViewController.swift
//  AdvCal
//
//  Created by Zaimone Miranda on 11/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNumber: UITextField!
    
    var firstNumber: Int = 0
    var currentOperation: String = ""
    var performingOperation = false
    var resultJustDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNumber.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNumber(_ sender: Any) {
        let btn = sender as! UIButton
        let num = (btn.titleLabel?.text)!
        
        
        if performingOperation || resultJustDisplayed{
            txtNumber.text = ""
            performingOperation = false
            resultJustDisplayed = false
        }
        
        if txtNumber.text == "0" {
            txtNumber.text = ""
        }
        
        txtNumber.text! += num
    }
    
    
    @IBAction func btnOperator(_ sender: Any) {
        let btn = sender as! UIButton
        let op = (btn.titleLabel?.text)!
        
        if let value = Int(txtNumber.text!){
            firstNumber = value
        }
        
        currentOperation = op
        performingOperation  = true
    }
    
    
    @IBAction func btnEqual(_ sender: Any) {
        if let secondNumber  = Int(txtNumber.text!){
            var result: Int = 0
            
            switch currentOperation {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "x":
                result = firstNumber * secondNumber
            case "/":
                result = secondNumber != 0 ? firstNumber / secondNumber : 0
            case "%":
                result = firstNumber % secondNumber
            default:
                result = secondNumber
            }
            
            txtNumber.text = String(result)
            firstNumber = result
            performingOperation = false
            resultJustDisplayed = true
        }
    }
    
    @IBAction func btnClear(_ sender: Any) {
        txtNumber.text = "0"
        firstNumber = 0
        currentOperation = ""
        performingOperation = false
    }
    
    @IBAction func btnPlusMinus(_ sender: Any) {
        if var value = Int(txtNumber.text!) {
            value = -value
            txtNumber.text = String(value)
        }
    }
    
}

