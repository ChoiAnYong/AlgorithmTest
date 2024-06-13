//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 6/13/24.
//

import Foundation

var input = Int(readLine()!)!

var result = 0
var check = true

while(!(input%5==0)) {
    if (input == 1) {
        print(-1)
        check = false
        break
    }
    result += 1
    input -= 2
}

if check {
    result += input/5
    print(result)
}
