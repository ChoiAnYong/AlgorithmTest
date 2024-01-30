//
//  2178_미로 탐색_BFS.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/19/24.
//
//최소의 이동을 요구하는 경우 BFS
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N: Int = input[0]
let M: Int = input[1]

var arr: [[Int]] = []

for _ in 0..<N {
    arr.append(readLine()!.map { Int(String($0))! })
}

var queue = [(0, 0)]
let (dx, dy) = ([-1, 1, 0, 0], [0, 0, 1, -1])// 상하좌우 이동 하기 위한 튜플

while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i] // nx, ny는 이동할 좌표
        if nx < 0 || ny < 0 || nx >= N || ny >= M { continue } // nx, ny가 배열 밖으로 넘어가는지 검사
        if arr[nx][ny] == 0 { continue } //해당 좌표가 0인 경우 이동 불가이므로 넘김
        if arr[nx][ny] == 1 {
            arr[nx][ny] = arr[x][y] + 1 // 이동하기 전의 위치에 1을 더하여 삽입(현재 위치까지 이동해온 칸 수 의미)
            // 해당 위치가 1이 아닌 수가 되므로 재방문도 방지
            queue.append((nx, ny)) // 상하좌우 중 arr이 1인 경우 큐에 삽입
        }
    }
}

print(arr[N-1][M-1])
