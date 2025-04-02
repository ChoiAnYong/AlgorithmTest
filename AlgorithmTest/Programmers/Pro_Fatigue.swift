//
//  Pro_Fatigue.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/22/25.
//

import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var result = 0
    
    func dfs(_ k: Int, _ visited: [Bool], _ count: Int) -> Int {
        var maxCount = count
        for i in 0..<dungeons.count {
            if !visited[i], k >= dungeons[i][0] {
                var visitedCopy = visited
                visitedCopy[i] = true
                maxCount = max(maxCount, dfs(k - dungeons[i][1], visitedCopy, count + 1))
            }
        }
        return maxCount
    }

    result = dfs(k, Array(repeating: false, count: dungeons.count), 0)
    return result
}
