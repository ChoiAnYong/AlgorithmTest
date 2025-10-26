//
//  Pro_귤고르기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/26/25.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int: Int] = [:]
    var count = 0
    var sum = 0
    
    for num in tangerine {
        dic[num, default: 0] += 1
    }
    
    let sorted = dic.values.sorted(by: >)
    
    for num in sorted {
        sum += num
        count += 1
        if sum >= k { break }
    }
    return count
}
