//
//  Pro_행렬테두리회전하기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/26/25.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var matrix: [[Int]] = (0..<rows).map { row in
        Array(1 + row * columns ... (row + 1) * columns)
    }
    var result: [Int] = []

    
    for query in queries {
        let (x1, y1, x2, y2) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1)
        var prev = matrix[x1][y1]
        var minValue = prev
        
        for y in y1+1...y2 {
            let temp = matrix[x1][y]
            matrix[x1][y] = prev
            prev = temp
            minValue = min(minValue, prev)
        }
        
        for x in x1+1...x2 {
            let temp = matrix[x][y2]
            matrix[x][y2] = prev
            prev = temp
            minValue = min(minValue, prev)
        }
        
        if y1 < y2 {
            for y in stride(from: y2-1, through: y1, by: -1) {
                let temp = matrix[x2][y]
                matrix[x2][y] = prev
                prev = temp
                minValue = min(minValue, prev)
            }
        }
        
        if x1 < x2 {
            for x in stride(from: x2-1, through: x1, by: -1) {
                let temp = matrix[x][y1]
                matrix[x][y1] = prev
                prev = temp
                minValue = min(minValue, prev)
            }
        }
        
        result.append(minValue)
    }
    
    return result
}
