//
//  valid.swift
//  calc
//
//  Created by Zen on 2023/3/22.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation


struct Validate {
    let args: [String]
   
    // Check if the input arguments are valid
    func checkForValidInput() {
        guard args.count % 2 != 0 else {
            ExceptionHandling(errorInput: "").incompleteExpression()
            return
        }
        
        for (index, arg) in args.enumerated() {
            // check if the argument is a valid integer
            if index % 2 == 0 {
                guard let _ = Int(arg) else {
                    ExceptionHandling(errorInput: arg).invalidInput()
                    return
                }
                
            // check if the argument is a valid operator (+, -, x, /, or %)
            } else {
                guard ["+", "-", "x", "/", "%"].contains(arg) else {
                    ExceptionHandling(errorInput: arg).unknownOperator()
                    return
                }
            }
        }

        isOutOfBounds()
    }
    
    // Check if any of the input arguments are out of the allowed range
    func isOutOfBounds() {
        for arg in args {
            guard let integerSize = Int(arg) else { continue }
            if integerSize > Int64.max || integerSize < Int32.min {
                ExceptionHandling(errorInput: args.joined(separator: " ")).integerOverflow()
            }
        }
    }
}

