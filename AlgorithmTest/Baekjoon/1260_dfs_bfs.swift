//
//  1260_dfs_bfs.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/29/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let N = input[0]
let M = input[1]
let V = input[2]

var graph: [[Int]] = Array(repeating: [], count: N+1)
var check = Array(repeating: false, count: N+1)
var result: String = ""

for  _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
    graph[a].sort()
    graph[b].sort()
}

func dfs(_ cur: Int) {
    check[cur] = true
    result += "\(cur) "
    for i in graph[cur] {
        if !check[i] {
            dfs(i)
        }
    }
}

func bfs(_ cur: Int) {
    var needVisited: [Int] = [cur]
    var visited = Set<Int>()
    
    while !needVisited.isEmpty {
        let node = needVisited.removeFirst()
        if !visited.contains(node) {
            visited.insert(node)
            result += "\(node) "
            needVisited.append(contentsOf: graph[node])
        }
    }
}

dfs(V)
print(result)

result = ""

bfs(V)
print(result)
