//
//  Pro_거리두기확인하기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/24/25.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    func check(_ place: [String]) -> Int {
        let map = place.map { Array($0) }
        
        for i in 0..<5 {
            for j in 0..<5 {
                if map[i][j] == "P" {
                    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
                    var queue = [(i, j, 0)]
                    visited[i][j] = true
                    
                    while !queue.isEmpty {
                        let (x, y, dis) = queue.removeFirst()
                        if dis > 0 && map[x][y] == "P" {
                            return 0
                        }
                        
                        if dis == 2 { continue }
                        
                        for dir in 0..<4 {
                            let nx = x + dx[dir]
                            let ny = y + dy[dir]
                            
                            if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 { continue }
                            if visited[nx][ny] { continue }
                            if map[nx][ny] == "X" { continue }
                            
                            visited[nx][ny] = true
                            queue.append((nx, ny, dis + 1))
                        }
                    }
                }
            }
        }
        
        return 1
    }
    
    for place in places {
        result.append(check(place))
    }
    
    return result
}
