//
//  10816_숫자카드.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/11/24.
//

import Foundation

let n: Int = Int(readLine()!)!
let nList = readLine()!.split(separator: " ").map { Int(String($0))! }

let m: Int = Int(readLine()!)!
let mList = readLine()!.split(separator: " ").map { Int(String($0))! }

var dic = [Int: Int]()
var result: [Int] = []

nList.forEach {
    if dic.keys.contains($0) {
        dic[$0]! += 1
    } else {
        dic[$0] = 1
    }
}

mList.forEach {
    if dic.keys.contains($0) {
        result.append(dic[$0]!)
    } else {
        result.append(0)
    }
}

print(result.map{ String($0) }.joined(separator: " "))
