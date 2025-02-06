//
//  1003_피보나치함수.swift
//  AlgorithmTest
//
//  Created by 최안용 on 6/20/24.
//

import Foundation

let t = Int(readLine()!)!

var dp = Array(repeating: (0,0), count: 41)
var input = [Int]()

dp[0] = (1,0)
dp[1] = (0,1)

for i in 2..<41 {
    dp[i] = (dp[i-1].0 + dp[i-2].0, dp[i-1].0 + dp[i-1].1)
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    input.append(n)
}

for i in 0..<t {
    print("\(dp[input[i]].0) \(dp[input[i]].1)")
}
