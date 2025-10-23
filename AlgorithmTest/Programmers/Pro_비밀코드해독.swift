//
//  Pro_비밀코드해독.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/23/25.
//

import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    var nums = Array(1...n)
    let qSets = q.map { Set($0) }
    var count = 0
    
    func dfs(_ index: Int, _ current: [Int]) {
        if current.count == 5 {
            var isValid = true
            let currentSet = Set(current)
            for j in 0..<ans.count {
                if currentSet.intersection(qSets[j]).count != ans[j] {
                    isValid = false
                    break
                }
            }
            if isValid { count += 1 }
            return
        }
        
        for i in index..<nums.count {
            dfs(i + 1, current + [nums[i]])
        }
    }
    
    dfs(0, [])

    return count
}
