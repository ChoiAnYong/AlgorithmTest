//
//  Pro_네트워크.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/24/25.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(_ node: Int) {
        visited[node] = true
        
        for i in 0..<n {
            if !visited[i] && computers[node][i] == 1 {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i)
            count += 1
        }
    }
    
    return count
}
