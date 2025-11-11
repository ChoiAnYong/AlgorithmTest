//
//  Pro_두원사이의정수쌍.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/11/25.
//

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var result: Int64 = 0
    
    for x in 1...r2 {
        let dx = Double(x)

        let maxY = Int(floor(sqrt(Double(r2*r2) - dx * dx)))
        let minY = x < r1 ? Int(ceil(sqrt(Double(r1*r1) - dx * dx))) : 0
        
        result += Int64(maxY - minY + 1)
    }
    
    return result * 4
}
