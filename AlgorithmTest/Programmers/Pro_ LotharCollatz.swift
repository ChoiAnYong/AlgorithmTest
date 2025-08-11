//
//  Pro_ LotharCollatz.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/11/25.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let list = collatz(k)
    let n = list.count - 1
    let areaList: [Double]  = areaCalculation(list)
    var result: [Double] = []
    
    ranges.forEach { nums in
        let range = (nums[0], n + nums[1])
        
        if range.1 - range.0 < 0 {
            result.append(-1.0)
        } else if range.1 - range.0 == 0 {
            result.append(0.0)
        } else {
            var sum = 0.0
            for i in  range.0..<range.1 {
                sum += areaList[i]
            }
            
            result.append(sum)
        }
    }
    
    return result
}

func areaCalculation(_ list: [Int]) -> [Double] {
    var areaList: [Double] = []
    
    for i in 0..<list.count-1 {
        areaList.append(Double(list[i] + list[i+1]) * 1 / 2)
    }
    
    return areaList
}

func collatz(_ k: Int) -> [Int] {
    var k = k
    var result: [Int] = []
    
    while k > 1 {
        result.append(k)
        
        if k%2 == 0 {
            k /= 2
        } else {
            k = k * 3 + 1
        }
    }
    
    result.append(k)
    
    return result
}
