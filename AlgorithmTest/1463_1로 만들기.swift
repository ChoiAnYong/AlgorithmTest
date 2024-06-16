//
//  1463_1로 만들기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 6/16/24.
//

import Foundation

let input = Int(readLine()!)!

var dp = Array(repeating: 0, count: input+1)

if input == 1 {
    print(0)
} else if input == 2 {
    print(1)
} else if input == 3 {
    print(1)
} else {
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    for i in 4...input {
        dp[i] = dp[i-1] + 1
        
        if i%2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        
        if i%3 == 0 {
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
    }
    print(dp[input])
}

