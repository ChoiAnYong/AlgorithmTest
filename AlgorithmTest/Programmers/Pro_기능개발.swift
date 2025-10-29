//
//  Pro_기능개발.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/29/25.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var workStack: [Int] = progresses.reversed()
    var speeds: [Int] = speeds.reversed()
    var result: [Int] = []
    
    while !workStack.isEmpty {
        var count = 0
        
        let first = workStack.last!
        let time = speeds.last!
        let day = (100-first) % time == 0 ? (100 - first) / time : (100 - first) / time + 1
        
        for i in 0..<workStack.count {
            workStack[i] += speeds[i] * day
        }
        
        while let last = workStack.last, last >= 100 {
            _ = workStack.removeLast()
            _ = speeds.removeLast()
            count += 1
        }
        
        if count != 0 {
            result.append(count)
        }
    }
    
    return result
}
