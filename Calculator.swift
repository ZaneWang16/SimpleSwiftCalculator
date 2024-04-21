//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var firstNumber: Int   //first number
    var operatorSymble: String  //the used operator
    var secondNumber: Int  //second number
    var startingPosition = 0  // The starting position of the current calculation pair in the input arguments array
    
    // Initialize the Calculator instance with the input argumentsx
    init(args: [String]) {
        
        // Ensure that there are at least three arguments, a valid expression should have at least two numbers and an operator
       guard args.count >= 3 else {
            
           //print error then exit and code condition 0 if not enough
            ExceptionHandling(errorInput: "").incompleteExpression()
            exit(0)
        }
        
        // Attempt to extract the number from the input arguments
        if let unwrappedFirstNumber = Int(args[startingPosition]) {
            firstNumber = unwrappedFirstNumber
        } else {
           
            // If first argument is not a valid integer, print an error and exit the program with a status code of 0
            ExceptionHandling(errorInput: args.joined(separator: " ")).invalidInput()
            exit(0)
        }
        
        // Extract the operator symbol from the input arguments
        operatorSymble = args[startingPosition + 1]
        
        if let unwrappedSecondNumber = Int(args[startingPosition + 2]) {
            secondNumber = unwrappedSecondNumber
        } else {
            ExceptionHandling(errorInput: args.joined(separator: " ")).invalidInput()
            exit(0)
        }
        
        // If the operator is not a priority operator (+ or -), find the next calculation pair in the input arguments
        if !isPriorityOperator() {
            findCalculationPair(args: args)
        }
    }
    
    // Find the next calculation pair in the input arguments array
    func findCalculationPair(args: [String]) {
        while startingPosition < args.count - 3 && !isPriorityOperator() {
            startingPosition += 2
            firstNumber = Int(args[startingPosition])!
            operatorSymble = args[startingPosition + 1]
            secondNumber = Int(args[startingPosition + 2])!
        }
        
        if startingPosition == args.count - 3 && !isPriorityOperator() {
            startingPosition = 0
            firstNumber = Int(args[0])!
            operatorSymble = args[1]
            secondNumber = Int(args[2])!
        }
    }
    
    // Perform the calculation and return the result
    func calculate() -> (value: Int?, position: Int) {
        var result: Int
        // Check for division by zero
        if (operatorSymble == "/" || operatorSymble == "%") && secondNumber == 0 {
            ExceptionHandling(errorInput: "").divByZero()
        }
        // Perform the calculation based on the operator symbol
        switch operatorSymble {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber % secondNumber
        default:
            result = 0
            ExceptionHandling(errorInput: operatorSymble).unknownOperator()
        }
        // Check if the result is within the allowed range
        Validate(args: ["\(result)"]).isOutOfBounds()
        return (result, startingPosition)
    }
    
    // Check if the operator is a priority operator (+ or -)
    func isPriorityOperator() -> Bool {
        switch operatorSymble {
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
}
