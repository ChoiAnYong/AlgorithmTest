//
//  2869_달팽이.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/14/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = input[0]
let B = input[1]
let V = input[2]


var result: Int
var dif = A-B
var target = V-B

if target%dif == 0 {
    result = target/dif
} else {
    result = target/dif + 1
}

print(result)
