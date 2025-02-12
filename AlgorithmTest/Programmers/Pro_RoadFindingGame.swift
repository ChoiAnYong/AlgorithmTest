//
//  Pro_RoadFindingGame.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/12/25.
//

import Foundation

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodeNumber = [Int : Int]()
    
    for i in 0..<nodeinfo.count {
        nodeNumber[nodeinfo[i][0]] = i + 1
    }
    
    let sortedNode = nodeinfo.sorted { $0[1] > $1[1] || ($0[1] == $1[1] && $0[0] < $1[0]) }
        
    var graph: [[Int]] = Array(repeating: [-1,-1], count: nodeinfo.count+1)
    
    for i in 1..<sortedNode.count {
        var queue: [Int] = []
        queue.append(sortedNode[0][0])
        
        while !queue.isEmpty {
            let currentX = queue.removeFirst()
            if sortedNode[i][0] > currentX {
                if graph[nodeNumber[currentX]!][1] == -1 {
                    graph[nodeNumber[currentX]!][1] = sortedNode[i][0]
                } else {
                    queue.append(graph[nodeNumber[currentX]!][1])
                }
            } else {
                if graph[nodeNumber[currentX]!][0] == -1 {
                    graph[nodeNumber[currentX]!][0] = sortedNode[i][0]
                } else {
                    queue.append(graph[nodeNumber[currentX]!][0])
                }
            }
        }
    }
    
    func preorder() -> [Int] {
        var stack: [Int] = []
        var result: [Int] = []
        stack.append(sortedNode[0][0])
        
        while !stack.isEmpty {
            let currentX = stack.removeLast()
            result.append(nodeNumber[currentX]!)
            if graph[nodeNumber[currentX]!][1] != -1 {
                stack.append(graph[nodeNumber[currentX]!][1])
            }
            if graph[nodeNumber[currentX]!][0] != -1 {
                stack.append(graph[nodeNumber[currentX]!][0])
            }
        }
        
        return result
    }
    
    func postorder() -> [Int] {
        var stack: [Int] = []
        var result: [Int] = []
        stack.append(sortedNode[0][0])
        
        while !stack.isEmpty {
            let currentX = stack.removeLast()
            result.append(nodeNumber[currentX]!)
            if graph[nodeNumber[currentX]!][0] != -1 {
                stack.append(graph[nodeNumber[currentX]!][0])
            }
            if graph[nodeNumber[currentX]!][1] != -1 {
                stack.append(graph[nodeNumber[currentX]!][1])
            }
        }
        
        return result.reversed()
    }
    
    return [preorder(), postorder()]
}

print(solution([[5, 3], [11, 5], [13, 3], [3, 5], [6, 1], [1, 3], [8, 6], [7, 2]]))


