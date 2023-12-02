//
//  2839_설탕배달.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/1/23.
//
//DP 문제
//2839번

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 5001, count: n+1)

if n > 2 {
    dp[3] = 1
    if n > 4{
        dp[5] = 1
    }
}

if n > 5 {
    for i in 6..<n+1 {
        dp[i] = min(dp[i-3], dp[i-5]) + 1
    }
}

if dp[n] > 5000 {
    print(-1)
} else {
    print(dp[n])
}
