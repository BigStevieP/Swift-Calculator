//
//  main.swift
//  calc
//
//  Created by Lahiru Ranasinghe on 5/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//


import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

func main(_ args : [String]){

    var checker = InputChecker(expression: args)
    do {
         //validate input
        //if there is any error, Error will be thrown
        let isValid = try checker.isValidExpression()
        
        if(isValid){
            //calculate expression
            var calculate = Calculator(expression: args)
            let result = try calculate.calculateExpression()
            print(result)
            exit(0)
        }

        
        
    }catch CalcErrors.divisionByZero {
        print("Cannot Devide by Zero")
        exit(1)
        
    }catch CalcErrors.invalidExpression {
        print("Invalid expression. Expected input of the form number operation number .. 2 + 3")
        exit(1)
        
    }catch CalcErrors.invalidNumber(let number) {
        print("Invalid number input found: \(number)")
        exit(1)
    }catch CalcErrors.invalidOperator(let character) {
        print("Invalid operator input found: \(character)")
        exit(1)
    } catch {
        print("Error \(error)")
        exit(1)
    }
    

}
main(args)
