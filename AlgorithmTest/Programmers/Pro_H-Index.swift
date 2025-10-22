//
//  Pro_H-Index.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/22/25.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    var hIndex = sorted[0]
    
    while hIndex >= 0 {
        var count = 0
        
        for num in sorted {
            if num >= hIndex {
                count += 1
            }
        }
        
        if count >= hIndex {
            break
        }
        
        hIndex -= 1
    }
    
    return hIndex
}
