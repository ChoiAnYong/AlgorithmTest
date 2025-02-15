//
//  Pro_TriangularSnail.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/16/25.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var number = 1
    var count = n
    var x = -1 , y = 0
    
    for i in 1...n {
        for _ in 0..<count {
            if i % 3 == 0 {
                x -= 1
                y -= 1
            } else if i % 3 == 1 {
                x += 1
            } else {
                y += 1
            }
            
            result[x][y] = number
            number += 1
        }
        count -= 1
    }
    
    return result.flatMap { $0 }.filter({ $0 != 0 })
}
