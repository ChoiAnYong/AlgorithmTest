//
//  Pro_ControlZ.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/8/25.
//

import Foundation

func solution(_ s:String) -> Int {
    let splitString = s.split(separator: " ")
    var sum = 0
    
    for i in 0..<splitString.count {
        if splitString[i] == "Z" {
            if let intValue = Int(splitString[i-1]) {
                sum -= intValue
            }
        } else {
            if let intValue = Int(splitString[i]) {
                sum += intValue
            }
        }
    }
    
    return sum
}

print(solution("-1 -2 -3 Z"))
