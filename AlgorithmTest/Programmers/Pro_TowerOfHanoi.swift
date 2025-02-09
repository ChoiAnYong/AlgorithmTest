//
//  Pro_TowerOfHanoi.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/9/25.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    return hanoi(n, 1, 2, 3)
}

func hanoi(_ n: Int, _ start: Int, _ temp: Int, _ end: Int) -> [[Int]] {
    if n == 1 {
        return [[start, end]]
    }
    
    return hanoi(n-1, start, end, temp) + [[start, end]] + hanoi(n-1, temp, start, end)
}
