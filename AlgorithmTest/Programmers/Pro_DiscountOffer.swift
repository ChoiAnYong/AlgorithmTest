//
//  Pro_DiscountOffer.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/7/25.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dic: [String: Int] = [:]
    var startIndex: Int = 0
    var check: Bool = true
    var result = 0
    
    for i in startIndex..<startIndex+10  {
        dic[discount[i], default: 0] += 1
    }
    
    while true {
        for i in 0..<want.count {
            if dic[want[i]] != number[i] {
                check = false
                break
            }
        }
        
        if discount.count-1 <= startIndex+9 {
            if check {
                result += 1
            }
            
            break
        }
        
        if dic[discount[startIndex]] != 0 {
            dic[discount[startIndex], default: 1] -= 1
        }
        
        startIndex += 1
        dic[discount[startIndex+9], default: 0] += 1
        
        if check {
            result += 1
        }
        check = true
    }
    
    return result
}
