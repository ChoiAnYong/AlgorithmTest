//
//  10818_최대최소.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/7/24.
//

import Foundation

let N: Int = Int(readLine()!)!

var list = readLine()!.split(separator: " ").map { Int(String($0))! }

print(list.min()!, list.max()!)
