//
//  Pro_bracket.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/5/25.
//

import Foundation

func solution(_ n: Int, _ a: Int, _ b: Int) -> Int {
    var answer = 0
    
    var aGroup = a % 2 == 0 ? a / 2 : (a + 1) / 2
    var bGroup = b % 2 == 0 ? b / 2 : (b + 1) / 2
    
    while true {
        if aGroup == bGroup {
            answer += 1
            break
        }
        
        aGroup = aGroup % 2 == 0 ? aGroup / 2 : (aGroup + 1) / 2
        bGroup = bGroup % 2 == 0 ? bGroup / 2 : (bGroup + 1) / 2
        answer += 1
    }
    
    return answer
}
