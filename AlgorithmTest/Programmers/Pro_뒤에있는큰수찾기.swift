//
//  Pro_뒤에있는큰수찾기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/27/25.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    var stack: [Int] = []
    
    for i in 0..<numbers.count {
        while let last = stack.last, numbers[i] > numbers[last] {
            result[last] = numbers[i]
            stack.removeLast()
        }
        
        stack.append(i)
    }
    
    return  result
}

print(solution([9, 1, 5, 3, 6, 2]    ))
