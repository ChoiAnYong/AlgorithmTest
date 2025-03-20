//
//  Pro_IslandTrip.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/19/25.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    let splitMaps = maps.map { Array($0) }
    var visited = Array(repeating: Array(repeating: false, count: splitMaps[0].count), count: maps.count)
    var result: [Int] = []
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        var queue = [(x, y)]
        visited[y][x] = true
        var sum = 0
        
        while !queue.isEmpty {
            let (curX, curY) = queue.removeFirst()
            
            if let value = Int(String(splitMaps[curY][curX])) {
                sum += value
            }
            
            for (dx, dy) in directions {
                let newX = curX + dx
                let newY = curY + dy
                
                if newX >= 0 && newY >= 0 && newX < splitMaps[0].count && newY < splitMaps.count {
                    if !visited[newY][newX] && splitMaps[newY][newX] != "X" {
                        visited[newY][newX] = true
                        queue.append((newX, newY))
                    }
                }
            }
        }
        
        return sum
    }
    
    for y in 0..<maps.count {
        for x in 0..<maps[y].count {
            if !visited[y][x] && splitMaps[y][x] != "X" {
                result.append(bfs(x, y))
            }
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
