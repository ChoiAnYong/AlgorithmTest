//
//  10807_개수세기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/16/23.
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
