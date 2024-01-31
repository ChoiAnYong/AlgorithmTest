//
//  2606_바이러스_bfs.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/31/24.
//

import Foundation

let c = Int(readLine()!)!
let n = Int(readLine()!)!
var count = 0
var graph = Array(repeating: Array(repeating: 0, count: 0), count: c)
var check = Array(repeating: false, count: c)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]-1].append(input[1])
    graph[input[1]-1].append(input[0])
}

func dfs(_ cur: Int) {
    check[cur] = true
    for i in graph[cur] {
        if !check[i-1] {
            count += 1
            dfs(i-1)
        }        
    }
}

dfs(0)
print(count)
