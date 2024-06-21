//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 6/21/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0]
let c = input[1]

var visit = Array(repeating: Array(repeating: false, count: c), count: r)
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var map = [[String]]()
var (fx, fy) = (-1, -1) //1번째 백조
var (sx, sy) = (-1, -1) //2번째 백조
var swanQueue: [(Int, Int)] = []
var waterQueue: [(Int, Int)] = []

for i in 0..<r {
    map.append(readLine()!.map{ String($0) })
    for j in 0..<c {
        if map[i][j] == "L" {
            if fx == -1 && fy == -1 {
                fx = i
                fy = j
            } else {
                sx = i 
                sy = j
            }
            map[i][j] = "."
            waterQueue.append((i, j))
        } else if map[i][j] == "." {
            waterQueue.append((i, j))
        }
    }
}

func meltIce() {
    var nextQueue: [(Int, Int)] = []
    var front = 0
    
    while front < waterQueue.count {
        let (x, y) = waterQueue[front]
        front += 1
        
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= r || ny >= c {
                continue
            }
            
            if map[nx][ny] == "X" {
                map[nx][ny] = "."
                nextQueue.append((nx, ny))
            }
        }
    }
    waterQueue = nextQueue
}

func moveSwan() -> Bool {
    var nextQueue: [(Int, Int)] = []
    var front = 0
    
    while front < swanQueue.count {
        let (x, y) = swanQueue[front]
        front += 1
        
        if x == sx && y == sy {
            return true
        }
        
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= r || ny >= c || visit[nx][ny] {
                continue
            }
            
            visit[nx][ny] = true
            if map[nx][ny] == "X" {
                nextQueue.append((nx,ny))
                continue
            }
            
            swanQueue.append((nx, ny))
        }
    }
    swanQueue = nextQueue
    return false
}

swanQueue = [(fx, fy)]
visit[fx][fy] = true

var count = 0
while true {
    if moveSwan() { break }
    meltIce()
    count += 1
}

print(count)
