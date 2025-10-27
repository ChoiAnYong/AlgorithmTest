//
//  Pro_미로탈출.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/23/25.
//

import Foundation

func solution(_ maps:[String]) -> Int {
    let map = maps.map { $0.map { $0 } }
    var startIndex: (Int, Int) = (0, 0)
    var leverIndex: (Int, Int) = (0, 0)
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            if map[i][j] == "S" {
                startIndex = (i, j)
            } else if map[i][j] == "L" {
                leverIndex = (i, j)
            }
        }
    }
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < map.count && y >= 0 && y < map[0].count
    }
    
    func bfs(_ x: Int, _ y: Int, _ target: Character) -> Int {
        var queue: [(Int, Int, Int)] = [(x, y, 0)]
        var visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
        visited[x][y] = true
        
        while !queue.isEmpty {
            let (x, y, time) = queue.removeFirst()
            
            if map[x][y] == target {
                return time
            }
            
            for dir in 0..<4 {
                let nx = x + dx[dir]
                let ny = y + dy[dir]
                    
                if isValid(nx, ny) && !visited[nx][ny] && map[nx][ny] != "X" {
                    visited[nx][ny] = true
                    queue.append((nx, ny, time+1))
                }
            }
        }
        return -1
    }
    
    let toLever = bfs(startIndex.0, startIndex.1, "L")
    if toLever == -1 { return -1 }
    let toEnd =  bfs(leverIndex.0, leverIndex.1, "E")
    if toEnd == -1 { return -1 }
    
    return toLever + toEnd
}
