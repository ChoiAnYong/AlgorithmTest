//
//  Pro_연속부분수열합의개수.swift
//  AlgorithmTest
//
//  Created by 최안용 on 9/17/25.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    let n = elements.count
    var sumSet = Set<Int>()
    
    for length in 1...n {
        var sumValue = elements[0..<length].reduce(0,+)
        sumSet.insert(sumValue)
        
        for start in 1..<n {
            sumValue -= elements[start-1]
            sumValue += elements[(start+length-1) % n]
            sumSet.insert(sumValue)
        }
    }
    
    return sumSet.count
}
