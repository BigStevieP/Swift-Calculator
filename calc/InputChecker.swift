//
//  InputValidity.swift
//  calc
//
//  Created by Lahiru Ranasinghe on 7/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation


struct InputChecker {
    private var expression : [String]
    private let operators = ["+","-","x","/","%"]
    
    //Constructor
    init(expression:[String]){
        self.expression = expression
    }
    
    //Check whether the expression is in correct format
    //expression length should be an odd number
    func checkExpression() throws{
        if( self.expression.count % 2 == 0){
            
            throw CalcErrors.invalidExpression
        }
    }
    
    //Check input characters are valid
    //(numbers and operators)
    func checkInputCharacters() throws {
        //check even characters are numbers
        var count = 1
        for i in args{
            //check for valid characters
            if(count % 2 == 0 && !self.operators.contains(i)){
                throw CalcErrors.invalidOperator(operator:i)
            }else if(count % 2 != 0 && Int(i) == nil){
                //check for valid numbers
                throw CalcErrors.invalidNumber(number: i)
            }
            count += 1
        }
    }
    
    //Return true if valid expression
    mutating func isValidExpression()throws -> Bool  {
        do{
            try checkExpression()
            try checkInputCharacters()
            return true
        }catch {
            throw error
        }
    }
    
}
