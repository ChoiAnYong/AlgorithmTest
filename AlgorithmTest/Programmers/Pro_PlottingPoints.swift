//
//  Pro_PlottingPoints.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/6/25.
//

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    let dPow = Int64(pow(Double(d), 2))
    var sum = 0
    var count = 0
    
    for i in stride(from: 0, to: d+1, by: k) {
        count = Int(sqrt(Double(dPow) - pow(Double(i), 2)))
        sum += count / k + 1;
    }
    
    return Int64(sum)
}

print(solution(3, 7))
