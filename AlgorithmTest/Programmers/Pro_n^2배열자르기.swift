//
//  Pro_n^2배열자르기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/23/26.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    
    for i in left...right {
        let i = Int(i)
        
        result.append(max(i / n, i % n) + 1)
    }
    
    return result
}
