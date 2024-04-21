//
//  exceptionhandle.swift
//  calc
//
//  Created by Zen on 2023/3/22.
//  Copyright © 2023 UTS. All rights reserved.
//
import Foundation

struct ExceptionHandling {
    let errorInput: String// The input that caused the error
    
    enum CalcError: Error { // Define the possible calculation errors
        case invalidInput
        case integerOverflow
        case divByZero
        case unknownOperator
        case incompleteExpression
    }
    
    func invalidInput() {
        print("Error: Invalid input \(errorInput)")
        exit(1)
    }
    
    func integerOverflow() {
        print("Error: Integer overflow for \(errorInput)")
        exit(2)
    }
    
    func divByZero() {
        print("Error: Division by zero")
        exit(3)
    }
    
    func unknownOperator() {
        print("Error: Unknown operator \(errorInput)")
        exit(4)
    }
    
    func incompleteExpression() {
        print("Error: The expression is incomplete. Please provide input in the format of [number] [operator number ...].")
        exit(5)
    }
}
