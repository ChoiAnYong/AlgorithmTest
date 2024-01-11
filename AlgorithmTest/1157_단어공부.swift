//
//  1157_단어공부.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/11/24.
//

import Foundation

var alpha = [Int](repeating: 0, count: 26)
let sentence = readLine()!.uppercased().map{String($0)}

for ch in sentence {
    let index: Int = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("A").value)
    alpha[index] += 1
}

var maxIndex: Int = 0
var check: Bool = false
alpha.enumerated().forEach {
    if alpha[maxIndex] < $0.1 {
        maxIndex = $0.0
    }
}

alpha.enumerated().forEach {
    if alpha[maxIndex] == $0.1 && $0.0 != maxIndex {
        check = true
    }
}

let result = String(UnicodeScalar(65 + maxIndex)!)
check ? print("?") : print(result)
