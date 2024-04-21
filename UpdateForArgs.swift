//
//  newargs.swift
//  calc
//
//  Created by Zen on 2023/3/22.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

struct UpdateArgs {
    let args: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    // Update the input arguments with the result of the current calculation
    func update() -> [String] {
        var newArgs: [String] = []
        
        // If the current calculation is the last one in the expression, return only the result value
        if resultPosition == 0 && args.count == 3 {
            newArgs = [String(resultValue!)]
            // If the current calculation is not the last one, on the left of the args array
        } else if resultPosition == 0 && args.count > 3 {
            newArgs = [String(resultValue!)] + Array(args[resultPosition + 3..<args.count])
            //if in the middle
        } else if resultPosition > 0 && resultPosition < args.count-3 {
            newArgs = Array(args[0..<resultPosition]) + [String(resultValue!)] + Array(args[resultPosition + 3..<args.count])
            //if is first one
        } else {
            newArgs = Array(args[0..<resultPosition]) + [String(resultValue!)]
        }
        
        return newArgs
    }
}

