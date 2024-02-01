//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/1/24.
//

import Foundation

let N = Int(readLine()!)!
var arr: [[Int]] = []
let (dx, dy) = ([-1, 1, 0, 0], [0, 0, -1, 1])
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var count: Int = 0
var result: [Int] = []

for _ in 0..<N {
    arr.append(readLine()!.map { Int(String($0))! })
}

func dfs(_ x: Int, _ y: Int) {
    count += 1
    visited[x][y] = true
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx >= 0 && nx < N && ny >= 0 && ny < N {
            if arr[nx][ny] == 1 && !visited[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == 1 && !visited[i][j] {
            count = 0
            dfs(i, j)
            result.append(count)
        }
    }
}

print(result.count)
result.sort()
print(result.map { String($0)}.joined(separator: "\n") )
