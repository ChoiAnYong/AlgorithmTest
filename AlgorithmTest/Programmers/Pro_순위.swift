//
//  Pro_순위.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/20/25.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var winDic: [Int: [Int]] = [:]
    var losDic: [Int: [Int]] = [:]
    var result: Int = 0
    
    results.forEach { result in
        winDic[result[0], default: []].append(result[1])
        losDic[result[1], default: []].append(result[0])
    }
    
    func bfs(_ dic: [Int: [Int]], _ num: Int) -> Int {
        var queue: [Int] = []
        var visited: [Bool] = Array(repeating: false, count: n + 1)
        var count = 0
        
        queue.append(num)
        visited[num] = true
        
        while !queue.isEmpty {
            let num = queue.removeFirst()
            
            for child in dic[num, default: []] {
                if !visited[child] {
                    queue.append(child)
                    visited[child] = true
                    count += 1
                }
            }
        }
        
        return count
    }
    
    for i in 1...n {
        let winCount = bfs(winDic, i)
        let losCount = bfs(losDic, i)
        
        if winCount + losCount == n - 1 {
            result += 1
        }
    }
    
    return result
}
