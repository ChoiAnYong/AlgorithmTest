//
//  2292_벌집.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/12/24.
//

import Foundation

let n = Int(readLine()!)!
var index: Int = 1
var output: Int = 1

for i in 1..<n {
    if index == i {
        index += 6 * output
        output += 1
    }
}

print(output)

