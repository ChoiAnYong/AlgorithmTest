//
//  ex5.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/30/23.
//

//Counting sort 사용
//O(n), O(nlog n)의 시간 복잡도가 걸리는 정렬로는 풀이할 수 없다.
//swift에서는 입력과 출력이 다른 언어에 비해 많이 느리다
import Foundation

var countingNums = [Int](repeating: 0, count: 10001)
let n = Int(readLine()!)!


for _ in 0..<n {
    countingNums[Int(readLine()!)!] += 1
}

var output = ""

for i in 1...10000 {
    output += String(repeating: "\(i)\n", count: countingNums[i])
}

print(output)
