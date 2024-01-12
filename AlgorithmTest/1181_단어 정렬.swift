//
//  1181_단어 정렬.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/11/24.
//

import Foundation

let n = Int(readLine()!)!
var sets: Set<String> = []

for _ in 0..<n {
    let words = readLine()!
    sets.insert(words)
}

var output = sets.sorted(by: {
    $0.count == $1.count ? $0 < $1 : $0.count < $1.count
})

output.forEach {
    print($0)
}
