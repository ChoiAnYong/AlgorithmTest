//
//  2644_촌수계산_dfs.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/3/24.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = input[0], end = input[1]
let m = Int(readLine()!)!

var relation = Array(repeating: Array(repeating: 0, count: 0), count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0], b = input[1]
    relation[a].append(b)
    relation[b].append(a)
}

var result: Int = -1
var visited = Array(repeating: false, count: n+1)

func dfs(_ node: Int, _ depth: Int) {
    visited[node] = true
    
    if node == end {
        result = depth
        return
    }
    
    for i in relation[node] {
        if !visited[i] {
            dfs(i, depth+1)
        }
    }
}

dfs(start, 0)
print(result)
