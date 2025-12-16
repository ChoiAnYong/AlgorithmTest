//
//  Pro_땅따먹기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/16/25.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    let row: Int = land.count
    let column: Int = land[0].count
    var dp = land
    
    for i in 1..<row {
        dp[i][0] += max(dp[i-1][1], dp[i-1][2], dp[i-1][3])
        dp[i][1] += max(dp[i-1][0], dp[i-1][2], dp[i-1][3])
        dp[i][2] += max(dp[i-1][0], dp[i-1][1], dp[i-1][3])
        dp[i][3] += max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
    }
    
    

    return dp[row-1].max()!
}
