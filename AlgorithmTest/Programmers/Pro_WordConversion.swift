//
//  Pro_WordConversion.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/17/25.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var depth = 0
    var queue: [(String, Int)] = []
    
    queue.append((begin, 0))
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        if cur.0 == target {
            depth = cur.1
            break
        }
        
        if cur.1 == words.count {
            depth = 0
            break
        }
        
        for word in words {
            if isChange(cur.0, word) {
                queue.append((word, cur.1 + 1))
            }
        }
    }
    
    return depth
}

func isChange(_ cur: String, _ next: String) -> Bool {
    var count = 0
    
    for i in cur.indices {
        if cur[i] != next[i] {
            count += 1
        }
    }
    
    return count == 1 ? true : false
}

print(solution("hit", "cog" , ["hot", "dot", "dog", "lot", "log", "cog"]))
