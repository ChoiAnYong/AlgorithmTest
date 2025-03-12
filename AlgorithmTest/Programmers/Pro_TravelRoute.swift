//
//  Pro_TravelRoute.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/12/25.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph: [String: [String]] = [:]
    var result: [String] = []
    
    for ticket in tickets {
        graph[ticket[0], default: []].append(ticket[1])
    }
    
    for key in graph.keys {
        graph[key]?.sort()
    }
    
    func dfs(_ start: String) {
        while let nexts = graph[start], !nexts.isEmpty {
            let next = graph[start]!.removeFirst()
            dfs(next)
        }
        
        result.append(start)
    }
    
    dfs("ICN")
    
    return result.reversed()
}

print(solution( [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"]]))
