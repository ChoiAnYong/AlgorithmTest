//
//
//  AlgorithmTest
//  11047_동전.swift
//  Created by 최안용 on 12/3/23.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var list: [Int] = [Int]()
var result: Int = 0

for _ in 0..<input[0] {
    list.append(Int(readLine()!)!)
}

//for문 마지막 인덱스부터 0 순으로 탐색하는 방법
//through가 있는 자리에는 to로 바꿔 쓸 수 있다. to는 해당 수를 포함하지 않고 through는 포함한다.
for i in stride(from: input[0]-1, through: 0, by: -1) {
    let count = input[1]/list[i]
    input[1] -= count*list[i]
    result += count
    
    if input[1] == 0 {
        break
    }
}

print(result)
