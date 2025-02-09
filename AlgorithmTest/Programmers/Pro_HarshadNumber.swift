//
//  Pro_HarshadNumber.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/9/25.
//

import Foundation

func solution(_ x:Int) -> Bool {
    let nString = String(x)
    var sum = 0
    nString.forEach { n in
        if let n = Int(String(n)) {
            sum += n
        }
    }
    
    return x % sum == 0 ? true : false
}
