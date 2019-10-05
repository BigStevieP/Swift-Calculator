//
//  Calculator.swift
//  calc
//
//  Created by Lahiru Ranasinghe on 7/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

struct Calculator {
    private var expression : [String]
    private var operate = Operator()
    
    //Constructor
    init(expression:[String]){
        self.expression = expression
    }
    
    //check character is a priority character (multiple, divide or modulus)
    func isPriorityOperator(character: String) -> Bool{
        if("x" == character || "/" == character || "%" == character){
            return true
        }else{
            return false
        }
    }
    
    //Handle evaluation with two numbers
    //Identify operator and call the respective evatuating method (for + , call add)
    //Assign value to first index of the chunk expression and remove operator and second number
    //return updated array, new length of iteration after array manipulation and index
    mutating func handleOperation(list: [String], index: Int, iterationLength: Int) throws -> ([String],Int,Int){
        
        do{
            var tempArray = list
            var tempLength = iterationLength
            var i = index
            
            var result = 0
            let num1 = Int(tempArray[index-1])!
            let num2 = Int(tempArray[index+1])!
            if("x" == tempArray[i]){
                 result  =  self.operate.multiply(num1: num1, num2: num2)
            }else if("/" == tempArray[i]){
                 result  = try self.operate.divide(num1: num1, num2: num2)
            } else if("%" == tempArray[i]){
                 result  = try self.operate.modulus(num1: num1, num2: num2)
            } else if("+" == tempArray[i]){
                 result  =  self.operate.add(num1: num1, num2: num2)
            }else if("-" == tempArray[i]){
                 result  =  self.operate.subtract(num1: num1, num2: num2)
                
            }
            //assign evaluated result to first number
            tempArray[index-1] = String(result)
           //remove operator
            tempArray.remove(at: index)
            //check array length
            if(index < tempLength){
              //remove second number
                tempArray.remove(at: index)
            }
            //update interation length and index after array manipulation
            tempLength = tempLength - 2
            i = i - 1
            
           
            return(tempArray,tempLength,i)
        }
        catch {
            throw error
        }
        
    }
    
    
    mutating func evaluateExpression() throws -> Int {
       
        //copy input to array for manipulation and assignments
        var array =  self.expression;
        var length = array.count
        var i = 0
        
        //Iterate and evaluate priority operators (x, / and %)
        while i < length{
            //check only when operator index
            if(i % 2 != 0){
                if(isPriorityOperator(character: array[i])){
                    (array,length,i) = try handleOperation(list: array,index: i,iterationLength: length )
                }
            }
            i += 1
            
        }
        
        //Iterate and evaluate rest of the operators (+ and -)
        var y = 0
        //check only when operator index
        while y < length{
            if(y % 2 != 0){
                (array,length,y) = try handleOperation(list: array,index: y,iterationLength: length )
            }
            y += 1
            
        }
        return Int(array[0])!
    }
    
    //Return the converted postfix
    mutating func calculateExpression()throws -> Int  {
        do{
            let result = try evaluateExpression()
            return result
        }catch {
            throw error
        }
        
    }
    
}
