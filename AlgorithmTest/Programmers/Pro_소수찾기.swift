//
//  Pro_소수찾기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/31/25.
//

import Foundation

func solution(_ numbers: String) -> Int {
    let digits = Array(numbers).map { String($0) }
    var numberSet: Set<Int> = []
    var visited = Array(repeating: false, count: digits.count)
        
    func dfs(_ nArr: [String]) {
        if nArr.count == digits.count {
            return
        }
        
        for i in 0..<digits.count {
            if !visited[i] {
                visited[i] = true
                dfs(nArr + [digits[i]])
                let number = Int((nArr + [digits[i]]).joined())!
                numberSet.insert(number)
                visited[i] = false
            }
        }
    }
    
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    dfs([])
    
    return numberSet.filter{ isPrime($0) }.count
}
