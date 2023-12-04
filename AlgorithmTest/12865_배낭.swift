//
//  12865_배낭.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/4/23.
//
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]

var items: [(Int, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    items.append((input[0], input[1]))
}

//2차원 배열 생성
var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n)

for i in 0..<n {
    for j in 1...k {
        //첫 번째 물건의 경우
        if i == 0 {
            //현재 items의 무게가 현재 무게 j 보다 크거나 같으면 해당 아이템의 가치가 최대
            if j >= items[i].0 {
                dp[i][j] = items[i].1
            }
            //두 번째 물건부터
        } else {
            //현재 무게보다 현재 items의 무게가 더 높다면 전 물품에서의 가치가를 삽입
            if j < items[i].0 {
                dp[i][j] = dp[i-1][j]
            //현재 무게에서 전 단계의 가치와 현재 items가치 + 전 단계에서 현재 items무게를 제외한 부분의 가치 합 중의 최대값 선택
            } else {
                dp[i][j] = max(dp[i-1][j], items[i].1 + dp[i-1][j-items[i].0])
            }
        }
    }
}

print(dp[n-1][k])
