//
//  Pro_퍼즐조각채우기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/4/26.
//

import Foundation

struct Position: Equatable {
    let x: Int
    let y: Int
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var emptyBox: [[Position]] = []
    var insertBox: [[Position]] = []
    var boardVisited = Array(repeating: Array(repeating: false, count: game_board[0].count), count: game_board.count)
    var tableVisited = Array(repeating: Array(repeating: false, count: table[0].count), count: table.count)
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var result = 0
    
    
    func findEmpty(_ x: Int, _ y: Int) {
        var result: [(Int, Int)] = []
        var queue: [(Int, Int)] = []
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            result.append(now)
            
            for i in 0..<4 {
                let nextX = now.0 + dx[i]
                let nextY = now.1 + dy[i]
                
                if nextX >= 0 && nextX < game_board.count && nextY >= 0 && nextY < game_board[0].count {
                    if !boardVisited[nextX][nextY] && game_board[nextX][nextY] == 0 {
                        boardVisited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }
        
        let minX = result.min(by: { $0.0 < $1.0} )!.0
        let minY = result.min(by: { $0.1 < $1.1} )!.1
        
        emptyBox.append(result.map { Position(x: $0.0-minX, y: $0.1-minY) })
    }
    
    for i in 0..<game_board.count {
        for j in 0..<game_board[0].count {
            if !boardVisited[i][j] && game_board[i][j] == 0 {
                boardVisited[i][j] = true
                findEmpty(i, j)
            }
        }
    }
    
    func findInsertBox(_ x: Int, _ y: Int) {
        var result: [(Int, Int)] = []
        var queue: [(Int, Int)] = []
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            result.append(now)
            
            for i in 0..<4 {
                let nextX = now.0 + dx[i]
                let nextY = now.1 + dy[i]
                
                if nextX >= 0 && nextX < table.count && nextY >= 0 && nextY < table[0].count {
                    if !tableVisited[nextX][nextY] && table[nextX][nextY] == 1 {
                        tableVisited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }
        
        let minX = result.min(by: { $0.0 < $1.0} )!.0
        let minY = result.min(by: { $0.1 < $1.1} )!.1
        
        insertBox.append(result.map { Position(x: $0.0-minX, y: $0.1-minY) })
    }
    
    for i in 0..<table.count {
        for j in 0..<table[0].count {
            if !tableVisited[i][j] && table[i][j] == 1 {
                tableVisited[i][j] = true
                findInsertBox(i, j)
            }
        }
    }
    
    outer: for empty in emptyBox {
        for (index, insert) in insertBox.enumerated() {
            if empty.count != insert.count { continue }
            
            var pre = insert
            for _ in 0..<4 {
                print(pre)
                pre = rotate(pre)
                if pre.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) == empty.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) {
                    insertBox.remove(at: index)
                    result += empty.count
                    continue outer
                }
            }
        }
    }
    
    return result
}

func rotate(_ arr: [Position]) -> [Position] {
    let row = arr.max(by: { $0.x < $1.x })!.x
    
    return arr.map { Position(x: $0.y, y: row - $0.x) }
}

print(solution([[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]], [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]))
