//
//  27433_피보나치.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/11/24.
//

import Foundation

let n = Int(readLine()!)!

func fibo(num: Int) -> Int {
    if num == 0 {
        return 1
    } else {
        return num*fibo(num: num-1)
    }
}

let result: Int = (fibo(num: n))

print(result)
