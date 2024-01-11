//
//  10807_개수 세기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/11/24.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {
    Int(String($0))!
}
let num = Int(readLine()!)!
var count: Int = 0
for i in input {
    if i == num {
        count += 1
    }
}
print(count)
