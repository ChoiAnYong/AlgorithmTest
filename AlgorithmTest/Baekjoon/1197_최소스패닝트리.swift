//
//  1197_최소스패닝트리.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/22/25.
//

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let v = input[0]
let e = input[1]
var costs: [[Int]] = []
var parent = Array(0...v)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    
    costs.append([input[0], input[1], input[2]])
}

costs.sort(by: { $0[2] < $1[2] })


func find(_ n: Int) -> Int {
    if parent[n] != n {
        parent[n] = find(parent[n])
    }
    return parent[n]
}

func union(_ n1: Int, _ n2: Int) -> Bool {
    let u = find(n1)
    let v = find(n2)
    
    if u == v {
        return false
    }
    
    parent[v] = u
    return true
}

var result: Int64 = 0
var count: Int = 0

for cost in costs {
    if union(cost[0], cost[1]) {
        result += Int64(cost[2])
        count += 1
        
        if count == v - 1 {
            break
        }
    }
}


print(result)
