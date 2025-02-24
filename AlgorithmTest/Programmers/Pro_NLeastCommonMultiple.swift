//
//  Pro_NLeastCommonMultiple.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/24/25.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    var answer: Int = arr[0]
    
    func getGCD(_ inputA: Int, _ inputB: Int) -> Int {
        var a = max(inputA, inputB)
        var b = min(inputA, inputB)
        
        while a % b != 0 {
            let r = a % b
            a = b
            b = r
        }
        
        return b
    }
    
    for i in 1..<arr.count {
        let gcd = getGCD(answer, arr[i])
        
        answer = answer * arr[i] / gcd
    }
    
    return answer
}
