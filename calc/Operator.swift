//
//  Operator.swift
//  calc
//
//  Created by Lahiru Ranasinghe on 7/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct Operator {
    
    //Add Operator (10 + 1)
    func add(num1: Int, num2: Int)-> Int  {
        return num1 + num2
    }
    
    //Subtract Operator (10 - 1)
    func subtract(num1: Int, num2: Int)-> Int  {
        
        return num1 - num2
    }
    
    //Multiple Operator (10 * 1)
    func multiply(num1: Int, num2: Int)-> Int  {
        
        return num1 * num2
    }
    
    //Division Operator (10 / 1)
    func divide(num1: Int, num2: Int)throws -> Int  {
        
        if(num2 == 0){
            throw CalcErrors.divisionByZero
        }
        return num1 / num2
    }
    
    //Modulus Operator (4 % 2)
    mutating func modulus(num1: Int, num2: Int) throws -> Int  {
        if(num2 == 0){
            throw CalcErrors.divisionByZero
        }
        return num1 % num2
        
    }
    
}
