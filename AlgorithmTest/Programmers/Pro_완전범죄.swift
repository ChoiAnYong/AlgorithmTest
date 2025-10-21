//
//  Pro_완전범죄.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/21/25.
//

import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    var result: Int = Int.max
    var dic: [String: Int] = [:]
    
    
    func dfs(_ depth: Int, _ a: Int, _ b: Int) {
        if a >= n || b >= m {
            return
        }
        
        if depth == info.count-1 {
            result = min(result, a)
            return
        }
        
        let key = "\(depth) \(a) \(b)"
        
        if let _ = dic[key] {
            return
        } else {
            dic[key] = 1
        }
        
        dfs(depth+1, a+info[depth+1][0], b)
        dfs(depth+1, a, b+info[depth+1][1])
    }
    
    dfs(-1, 0, 0)
    
    return result == Int.max ? -1 : result
}
