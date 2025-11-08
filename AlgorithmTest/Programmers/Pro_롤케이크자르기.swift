//
//  Pro_롤케이크자르기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/8/25.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    var rightDic: [Int: Int] = [:]
    var leftDic: [Int: Int] = [:]
    var result: Int = 0
    
    for n in topping {
        rightDic[n, default: 0] += 1
    }
    
    for n in topping {
        if let count = rightDic[n] {
            if count - 1 > 0 {
                rightDic[n]! -= 1
            } else {
                rightDic[n] = nil
            }
        }
        
        leftDic[n, default: 0] += 1
        
        if rightDic.count == leftDic.count { result += 1 }
    }
    
    return result
}
