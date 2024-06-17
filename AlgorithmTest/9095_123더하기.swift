//
//  9095_123더하기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 6/17/24.
//

import Foundation

let t = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 11)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...10 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for _ in 0..<t {
    let input = Int(readLine()!)!
    print(dp[input])
}
