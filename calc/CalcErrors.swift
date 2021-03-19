import Foundation

enum CalcErrors : Error{
    case divisionByZero
    case invalidOperator (operator: String)
    case invalidNumber (number:String)
    case invalidExpression
}
