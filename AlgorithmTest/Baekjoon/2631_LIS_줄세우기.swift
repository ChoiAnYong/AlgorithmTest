//
//  2631_LIS_줄세우기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/16/24.
//

import Foundation

func binarySearch(_ target: Int) -> Int { // 이분탐색
    var (left, right) = (0, dp.count - 1)
    
    while left < right {
        let mid = (left + right) / 2
        
        if dp[mid] < target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return right
}

let n = Int(readLine()!)!

var arr: [Int] = []

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    arr.append(input)
}

var dp: [Int] = [arr[0]] //LIS의 길이, 실제 LIS와 길이만 같고 내용은 다름 (LIS = 최장 증가 부분 수열)

for i in 0..<n {
    if arr[i] > dp.last! {
        dp.append(arr[i])
    } else {
        let index = binarySearch(arr[i])
        dp[index] = arr[i]
    }
}

print(n - dp.count)
