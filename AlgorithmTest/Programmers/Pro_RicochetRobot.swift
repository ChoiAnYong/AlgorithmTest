//
//  Pro_RicochetRobot.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/17/25.
//

import Foundation

struct Position: Equatable {
    var x: Int = 0
    var y: Int = 0
    var depth: Int = 0
}

func solution(_ board:[String]) -> Int {
    var start = Position()
    var queue: [Position] = []
    
    let arr = board.map { $0.map { String($0) } }
    
    for i in 0..<arr.count {
        if let xIndex = arr[i].firstIndex(where: { $0 == "R"}) {
            start.x = xIndex
            start.y = i
        }
    }
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: arr[0].count+1), count: arr.count+1)
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < arr[0].count && y >= 0 && y < arr.count && arr[y][x] != "D"
    }
    
    func slide(_ position: Position, _ xMove: Int, _ yMove: Int) -> Position {
        var newPosition = position
                
        while isValid(newPosition.x + xMove, newPosition.y + yMove) {
            newPosition.x += xMove
            newPosition.y += yMove
        }
        
        return newPosition
    }
    
    queue.append(start)
    visited[start.y][start.x] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        if arr[current.y][current.x] == "G" {
            return current.depth
        }
        
        for i in 0..<4 {
            if i == 0 {
                var new = slide(current, -1, 0)
                if !visited[new.y][new.x] {
                    new.depth += 1
                    queue.append(new)
                    visited[new.y][new.x] = true
                }
            } else if i == 1 {
                var new = slide(current, 1, 0)
                if !visited[new.y][new.x] {
                    new.depth += 1
                    queue.append(new)
                    visited[new.y][new.x] = true
                }
            } else if i == 2 {
                var new = slide(current, 0, -1)
                if !visited[new.y][new.x] {
                    new.depth += 1
                    queue.append(new)
                    visited[new.y][new.x] = true
                }
            } else {
                var new = slide(current, 0, 1)
                if !visited[new.y][new.x] {
                    new.depth += 1
                    queue.append(new)
                    visited[new.y][new.x] = true
                }
            }
        }
    }
    
    return -1
}
