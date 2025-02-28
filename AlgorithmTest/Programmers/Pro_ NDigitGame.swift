//
//  Pro_ NDigitGame.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/28/25.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var answer = ""
    var str: [Character] = []
    
    for i in 0..<t*m {
        str.append(contentsOf: String(i, radix: n, uppercase: true))
    }
    
    for i in stride(from: p-1, through: str.count, by: m) {
        answer += String(str[i])
        if answer.count == t {
            break
        }
    }
    
    return answer
}
