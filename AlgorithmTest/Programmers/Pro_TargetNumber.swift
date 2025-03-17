//
//  Pro_TargetNumber.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/13/25.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var results: [Int] = []
    var index = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == numbers.count {
            results.append(sum)
            return
        }
                
        dfs(index+1, sum + numbers[index])
        dfs(index+1, sum - numbers[index])
    }
    
    dfs(0, 0)
    
    let result = results.filter { $0 == target }
    
    return result.count
}
