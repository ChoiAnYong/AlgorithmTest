//
//  Pro_연속된부분수열의합.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/7/25.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var start: Int = 0
    var end: Int = 0
    var sum: Int = 0
    var minLen: Int = Int.max
    var result: [Int] = []
    
    while end < sequence.count {
        sum += sequence[end]
        
        while sum > k && start <= end {
            sum -= sequence[start]
            start += 1
        }
        
        if sum == k {
            let len = end - start + 1
            if len < minLen {
                minLen = len
                result = [start, end]
            } else if len == minLen && start < result[0] {
                result = [start, end]
            }
        }
        
        end += 1
    }
    
    return result
}
