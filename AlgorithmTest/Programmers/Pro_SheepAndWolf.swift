//
//  Pro_SheepAndWolf.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/27/25.
//

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: info.count)
    var count: [Int] = Array(repeating: 0, count: 2)
    var maxCount: Int = 0
    
    edges.forEach { edge in
        graph[edge[0]].append(edge[1])
    }
    
    func dfs(_ nodes: [Int], _ count: [Int]) {
        for node in nodes {
            var nextCount = count
            nextCount[info[node]] += 1
            
            guard nextCount[0] > nextCount[1] else { continue }
            
            maxCount = max(maxCount, nextCount[0])
            
            var nextNodes = nodes
            let index = nextNodes.firstIndex(of: node)!
            nextNodes.remove(at: index)
            
            nextNodes.append(contentsOf: graph[node])
                        
            dfs(nextNodes, nextCount)
        }
    }
    
    dfs([0], count)
    
    return maxCount
}
