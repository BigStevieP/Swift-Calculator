//
//  CalcErrors.swift
//  calc
//
//  Created by Lahiru Ranasinghe on 7/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

enum CalcErrors : Error{
    case divisionByZero
    case invalidOperator (operator: String)
    case invalidNumber (number:String)
    case invalidExpression
}
