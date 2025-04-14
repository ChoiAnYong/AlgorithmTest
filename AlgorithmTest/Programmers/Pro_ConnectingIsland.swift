//
//  Pro_ConnectingIsland.swift
//  AlgorithmTest
//
//  Created by 최안용 on 4/14/25.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parent = [Int](0..<n)
    
    let sortedCosts = costs.sorted { $0[2] < $1[2] }
    
    var totalCost = 0
    var edgeCount = 0
    
    for cost in sortedCosts {
        let from = cost[0]
        let to = cost[1]
        let weight = cost[2]
        
        if findParent(&parent, from) != findParent(&parent, to) {
            union(&parent, from, to)
            totalCost += weight
            edgeCount += 1
            
            if edgeCount == n-1 {
                break
            }
        }
    }
    
    return totalCost
}

func findParent(_ parent: inout [Int], _ node: Int) -> Int {
    if parent[node] != node {
        parent[node] = findParent(&parent, parent[node])
    }
    return parent[node]
}

func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let rootA = findParent(&parent, a)
    let rootB = findParent(&parent, b)
    
    if rootA < rootB {
        parent[rootB] = rootA
    } else {
        parent[rootA] = rootB
    }
}
