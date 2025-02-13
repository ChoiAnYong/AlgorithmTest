//
//  Pro_QuadCompression.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/13/25.
//

import Foundation

func solution(_ arr: [[Int]]) -> [Int] {
    return compression(arr)
}

func check(_ arr: [[Int]]) -> Int? {
    let first = arr[0][0]
    
    for row in arr {
        for value in row {
            if value != first {
                return nil
            }
        }
    }
    
    return first
}

func compression(_ arr: [[Int]]) -> [Int] {
    let n = arr.count
    var result = [0, 0]
    
    if let compressedValue = check(arr) {
        result[compressedValue] += 1
        return result
    }
    
    let half = n / 2
    var subArrays: [[[Int]]] = []

    subArrays.append(arr[0..<half].map { Array($0[0..<half]) })
    subArrays.append(arr[0..<half].map { Array($0[half..<n]) })
    subArrays.append(arr[half..<n].map { Array($0[0..<half]) })
    subArrays.append(arr[half..<n].map { Array($0[half..<n]) })
    
    for subArray in subArrays {
        let subResult = compression(subArray)
        result[0] += subResult[0]
        result[1] += subResult[1]
    }
    
    return result
}
