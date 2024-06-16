//
//  1976_여행가자.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/15/24.
//
import Foundation

let N = Int(readLine()!)! // 도시의 수
let M = Int(readLine()!)! // 여행 계획에 속한 도시들의 수

var list: [[Int]] = []
var answer: Bool = true

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map({Int($0)!})
    list.append(input)
}

var plan = readLine()!.split(separator: " ").map({Int($0)!})

var check = Array(repeating: false, count: N)

func dfs(index : Int) {
    check[index] = true
    
    for i in 0..<N {
        if list[index][i] == 1 && check[i] == false {
            dfs(index: i)
        }
    }
}

dfs(index: plan[0]-1)

for p in plan {
    if !check[p-1] {
        answer = false
        break
    }
}

print(answer ? "YES":"NO")
