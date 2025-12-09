//
//  Pro_배달.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/8/25.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var graph: [[(Int, Int)]] = Array(repeating: [], count: N+1)
    var minTimes: [Int] = Array(repeating: Int.max, count: N+1)
    var possible: Set<Int> = []
    
    for path in road {
        let node1 = path[0]
        let node2 = path[1]
        let time = path[2]
        
        graph[node1].append((node2, time))
        graph[node2].append((node1, time))
    }
    
    func dfs(_ node: Int, _ time: Int) {
        for next in graph[node] {
            let nextNode = next.0
            let nextTime = time + next.1
            
            if minTimes[nextNode] <= nextTime || nextTime > k  { continue }
            
            possible.insert(next.0)
            minTimes[nextNode] = nextTime
            dfs(nextNode, nextTime)
        }
    }
    
    minTimes[1] = 0
    dfs(1, 0)
    possible.insert(1)
    return possible.count
}
