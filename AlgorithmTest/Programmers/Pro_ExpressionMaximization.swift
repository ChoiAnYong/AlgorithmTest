//
//  Pro_ExpressionMaximization.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/22/25.
//

import Foundation

enum Operators: Character {
    case multiple = "*"
    case plus = "+"
    case minus = "-"
    
    func operate(_ a: Int64, _ b: Int64) -> Int64 {
        switch self {
            case .multiple: return a * b
            case .plus: return a + b
            case .minus: return a - b
        }
    }
}

func operate(
    numbers: [Int64],
    operations: [Character],
    prior: [Operators]
) -> Int64 {
    var numbers = numbers
    var operations = operations
    
    for operation in prior {
        while let index = operations.firstIndex(of: operation.rawValue) {
            numbers[index] = operation.operate(numbers[index], numbers[index+1])
            numbers.remove(at: index+1)
            operations.remove(at: index)
        }
    }
    
    return abs(numbers[0])
}

func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["*", "+", "-"])
                            .compactMap { Int64($0) }
    let operators = Array(expression.filter { Int(String($0)) == nil })
    let fixedOperators = "+-*"
    var maxValue: Int64 = 0
    
    for first in fixedOperators {
        for second in fixedOperators {
            guard first != second else { continue }
            let third = fixedOperators.filter { $0 != first && $0 != second }[0]
            let result = operate(
                numbers: numbers,
                operations: operators,
                prior: [
                    Operators(rawValue: first)!,
                    Operators(rawValue: second)!,
                    Operators(rawValue: third)!
                ]
            )
            maxValue = max(result, maxValue)
        }
    }
    
    return maxValue
}
