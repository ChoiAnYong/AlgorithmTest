//
//  Pro_지게차와크레인.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/21/25.
//

import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    var map = storage.map { $0.map { $0 } }
    var count = 0
    
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < map.count && y >= 0 && y < map[0].count
    }
    
    func crane(_ target: Character) {
         for i in 0..<map.count {
                for j in 0..<map[0].count {
                    if map[i][j] == target {
                        map[i][j] = "1"
                        count += 1
                    }
                }
            }
    }
    
    func checkConnected(_ x: Int, _ y: Int) -> Bool {
        var visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
        var queue = [(x, y)]
        
        visited[x][y] = true
        
        while !queue.isEmpty {
            let (cx, cy) = queue.removeFirst()
            
             if cx == 0 || cy == 0 || cx == map.count-1 || cy == map[0].count-1 {
                return true
            }
            
            for dir in 0..<4 {
                let nx = cx + dx[dir]
                let ny = cy + dy[dir]
                
                if isValid(nx, ny) && !visited[nx][ny] && map[nx][ny] == "1" {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
        
        return false
    }
    
    func stacker(_ target: Character) {
        var targetIndexs: [(Int, Int)] = []
        
         for i in 0..<map.count {
                for j in 0..<map[0].count {
                    if map[i][j] == target {
                        if checkConnected(i, j) {
                            targetIndexs.append((i, j))
                        }
                    }
                }
            }
        
        for index in targetIndexs {
            map[index.0][index.1] = "1"
            count += 1
        }
    }
    
    func move(_ commend: String) {
        let targets = commend.map { $0 }
        if targets.count > 1 {
            crane(targets[0])
        } else {
            stacker(targets[0])
        }
    }

    for i in 0..<requests.count {
        move(requests[i])
    }
    
    return map.count * map[0].count - count
}
