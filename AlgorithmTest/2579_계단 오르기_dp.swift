//
//  2579_계단 오르기_dp.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/2/24.
//

import Foundation

let N: Int = Int(readLine()!)!
var arr: [Int] = []
var result = Array(repeating: 0, count: N)

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}


if N == 1 {
    print(arr[0])
} else if N == 2 {
    print(arr[0]+arr[1])
} else if N == 3 {
    print(max(arr[0]+arr[2], arr[1]+arr[2]))
} else {
    result[0] = arr[0]
    result[1] = arr[0] + arr[1]
    result[2] = max(arr[0]+arr[2], arr[1]+arr[2])
    
    for i in 3..<N {
        result[i] = max(result[i-3] + arr[i-1] + arr[i], result[i-2] + arr[i])
    }
    print(result[N-1])
}



// 규칙
// 1.계단은 한 번에 한 계단씩 또는 두 계단씩 오를 수 있다. 즉, 한 계단을 밟으면서 이어서 다음 계단이나, 다음 다음 계단으로 오를 수 있다
// 2.연속된 세 개의 계단을 모두 밟아서는 안 된다. 단, 시작점은 계단에 포함되지 않는다.
// 3.마지막 도착 계단은 반드시 밟아야 한다


