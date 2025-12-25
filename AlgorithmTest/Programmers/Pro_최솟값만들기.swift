//
//  Pro_최솟값만들기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/25/25.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var sortedA = A.sorted()
    var sortedB = B.sorted(by: >)
    
    for i in 0..<A.count {
        ans += sortedA[i] * sortedB[i]
    }

    return ans
}
