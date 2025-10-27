//
//  Pro_마법의엘리베이터.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/27/25.
//

import Foundation

func solution(_ storey:Int) -> Int {
    var s = storey
    var stones = 0
    
    while s > 0 {
        let d = s % 10
        let next = (s / 10) % 10
        
        if d > 5 || (d == 5 && next >= 5) {
            stones += 10 - d
            s = s / 10 + 1
        } else {
            stones += d
            s /= 10
        }
    }
    
    return stones
}
