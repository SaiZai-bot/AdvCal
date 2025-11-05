//
//  ViewController.swift
//  AdvCal
//
//  Created by Zaimone Miranda on 11/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNumber: UITextField!
    
    var firstNumber: Double = 0
    var currentOperation: String = ""
    var performingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNumber.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNumber(_ sender: Any) {
        let btn = sender as! UIButton
        let num = (btn.titleLabel?.text)!        
        
        if performingOperation {
            txtNumber.text = ""
            performingOperation = false
        }
        
        if txtNumber.text == "0" {
            txtNumber.text = ""
        }
        
        txtNumber.text! += num
    }
    
    
    @IBAction func btnOperator(_ sender: Any) {
        let btn = sender as! UIButton
        let op = (btn.titleLabel?.text)!
        
        if let value = Double(txtNumber.text!){
            firstNumber = value
        }
        
        currentOperation = op
        performingOperation  = true
    }
    
    
    @IBAction func btnEqual(_ sender: Any) {
        if let secondNumber  = Double(txtNumber.text!){
            var result: Double = 0
            
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
                result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
            default:
                result = secondNumber
            }
            
            txtNumber.text = String(result)
            performingOperation = false
        }
    }
    
    @IBAction func btnClear(_ sender: Any) {
        txtNumber.text = "0"
        firstNumber = 0
        currentOperation = ""
        performingOperation = false
    }
    
    @IBAction func btnPlusMinus(_ sender: Any) {
        if var value = Double(txtNumber.text!) {
            value = -value
            txtNumber.text = String(value)
        }
    }
    
}

