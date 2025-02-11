//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/10/25.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    var visited: [Bool] = Array(repeating: false, count: n+1)
    visited[0] = true
    var nodesCount: [Int] = []
    
    wires.forEach { wire in
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    
    for i in 0..<wires.count {
        if let aIndex = graph[wires[i][0]].firstIndex(where: { $0 == wires[i][1]}),
           let bIndex = graph[wires[i][1]].firstIndex(where: { $0 == wires[i][0]}) {
            graph[wires[i][0]].remove(at: aIndex)
            graph[wires[i][1]].remove(at: bIndex)
            nodesCount.append(bfs(graph, visited))
            graph[wires[i][0]].append(wires[i][1])
            graph[wires[i][1]].append(wires[i][0])
            
        }
    }
    
    guard let minCount = nodesCount.min() else { return 0 }
    return minCount
}

func bfs(_ graph: [[Int]], _ visited: [Bool]) -> Int {
    var firstGroupCount: Int = 0
    var secondGroupCount: Int = 0
    var visited = visited
    var queue: [Int] = []
    
    queue.append(1)
    visited[1] = true
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        firstGroupCount += 1
        
        for node in graph[currentNode] {
            if !visited[node] {
                queue.append(node)
                visited[node] = true
            }
        }
    }
    
    guard let notVisitedNode = visited.firstIndex(where: { $0 == false }) else { return 0 }
    
    queue.append(notVisitedNode)
    visited[notVisitedNode] = true
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        secondGroupCount += 1
        
        for node in graph[currentNode] {
            if !visited[node] {
                queue.append(node)
                visited[node] = true
            }
        }
    }
    
    return abs(firstGroupCount - secondGroupCount)
}
