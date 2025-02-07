//
//  Pro_ FurthestNode.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/7/25.
//

import Foundation

func solution(_ n: Int, _ edge: [[Int]]) -> Int {
    let visited: [Bool] = Array(repeating: false, count: n+1)
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    
    edge.forEach { edge in
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    return bfs(graph: graph, inputVisited: visited)
}

func bfs(graph: [[Int]], inputVisited: [Bool]) -> Int {
    var queue: [[Int]] = [[1, 0]]
    var visited = inputVisited
    var result = 0
    var maxDepth = 0
    
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        var check = true
        var depth = node[1]
        
        var isLast: Bool = true
        graph[node[0]].forEach { node in
            if !visited[node] {
                isLast = false
            }
        }
        
        if isLast {
            if maxDepth < depth {
                maxDepth = depth
                result = 1
            } else if maxDepth == depth {
                result += 1
            }
        }
        
        graph[node[0]].forEach { node in
            if !visited[node] {
                if check {
                    depth += 1
                    check = false
                }
                visited[node] = true
                queue.append([node, depth])
            }
        }
    }
    
    return result
}

print(solution(6, [[1, 2], [2, 3], [2, 4], [3, 5], [3, 6]]))
