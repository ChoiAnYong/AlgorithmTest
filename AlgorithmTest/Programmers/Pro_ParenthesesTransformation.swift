//
//  Pro_ParenthesesTransformation.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/1/25.
//

import Foundation

func solution(_ p:String) -> String {
    let pArr = p.map { String($0) }
    let result = replace(pArr)
    
    return result.joined()
}

func replace(_ arr: [String]) -> [String] {
    var firstGroup: [String] = []
    var secondGroup: [String] = []
    var leftCount: Int = 0
    var rightCount: Int = 0
    
    if arr.isEmpty {
        return []
    }
    
    if isValid(arr) {
        return arr
    }
    
    for i in 0..<arr.count {
        firstGroup.append(arr[i])
        
        if arr[i] == "(" {
            leftCount += 1
        } else {
            rightCount += 1
        }
        
        if leftCount == rightCount {
            secondGroup = Array(arr[i+1..<arr.count])
            break
        }
    }
    
    
    if isValid(firstGroup) {
        return firstGroup + replace(secondGroup)
    } else {
        let newStr = ["("] + replace(secondGroup) + [")"]
        firstGroup.removeFirst()
        firstGroup.removeLast()
        firstGroup = firstGroup.map { $0 == "(" ? ")" : "(" }
        return newStr + firstGroup
    }
}

func isValid(_ arr: [String]) -> Bool {
    var stack = 0
    
    for ch in arr {
        if ch == "(" {
            stack += 1
        } else {
            stack -= 1
        }
        
        if stack < 0 {
            return false
        }
    }
    
    return stack == 0
}
