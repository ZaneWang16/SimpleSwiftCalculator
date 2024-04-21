//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
import Foundation

var args = CommandLine.arguments //collect arguments
args.removeFirst()
Validate(args: args).checkForValidInput() //check for vaildation

if args.count == 1 { // If there is only one argument, print it as an integer
    print(Int(args[0])!)
} else {
    var currentArgs = args //calculate inputs
    while currentArgs.count > 2 {
        let calculator = Calculator(args: currentArgs)
        let (value, position) = calculator.calculate()
        // Update the arguments based on the calculation result
        currentArgs = UpdateArgs(args: currentArgs, resultValue: value, resultPosition: position).update()
    }
    print(currentArgs.first!) // Print the final result
}













