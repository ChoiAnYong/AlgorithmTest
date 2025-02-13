//
//  Pro_SharedTaxiFare.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/13/25.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var distances = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
    var answer = 0
    for i in 1...n {
        distances[i][i] = 0
    }
    
    fares.forEach { fare in
        distances[fare[0]][fare[1]] = fare[2]
        distances[fare[1]][fare[0]] = fare[2]
    }
    ///k = 거쳐가는 노드
    ///i = 시작 노드
    ///j = 도착 노드
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if distances[i][k] == Int.max || distances[k][j] == Int.max {
                    continue
                }
                
                if distances[i][k] + distances[k][j] < distances[i][j] {
                    distances[i][j] = distances[i][k] + distances[k][j]
                }
            }
        }
    }
    
    if distances[s][a] != Int.max, distances[s][b] != Int.max {
        answer = distances[s][a] + distances[s][b]
    }
    
    for i in 1...n {
        if distances[s][i] != Int.max, distances[i][a] != Int.max, distances[i][b] != Int.max {
            answer = min(answer, distances[s][i] + distances[i][a] + distances[i][b])
        }
    }
    
    return answer
}
