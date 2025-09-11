//
//  Pro_점프와순간이동.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/23/25.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var result = 0
    
    var n = n
    
    while n > 0 {
        result += n % 2
        
        n = n%2 == 0 ? n/2 : n-1
    }
    
    return result
}
