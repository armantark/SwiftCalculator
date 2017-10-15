//
//  ViewController.swift
//  Calculator
//
//  Created by Arman Tarkhanian on 6/10/15.
//  Copyright (c) 2015 Arman Tarkhanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// String for the number display
    @IBOutlet weak var numberDisplay: UILabel!

    var userTypingANumber = false
    var brain = CalculatorBrain()
    
    //Puts the number in the label
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userTypingANumber{
            numberDisplay.text = numberDisplay.text! + digit
            _displayValue = (numberDisplay.text! as NSString).doubleValue
        } else {
            numberDisplay.text! = digit
            _displayValue = (numberDisplay.text! as NSString).doubleValue
            userTypingANumber = true
        }
    }
    //Performs operations based on what button is pressed
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    //Puts value on display to the array and prints to console
    @IBAction func enter() {
        userTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    //Clears display
    @IBAction func clear() {
        userTypingANumber = false
        displayValue = 0
        brain.clear()
    }
    //Allows the pi button to work
    @IBAction func pi() {
        userTypingANumber = true
        if numberDisplay.text != "0" {
            enter()
            displayValue = M_PI
            enter()
        } else {
            displayValue = M_PI
            enter()
        }
    }
    //The e button
    @IBAction func e() {
        userTypingANumber = true
        if numberDisplay.text != "0" {
            enter()
            displayValue = M_E
            enter()
        } else {
            displayValue = M_E
            enter()
        }
    }
    //Transforms the number display string to a double
    private var _displayValue:Double = 0
    var displayValue: Double {
        get {
            return _displayValue
        }
        set(newValue) {
            _displayValue = newValue
            numberDisplay.text = NSString(format: "%g", newValue) as String
        }
    }
}

