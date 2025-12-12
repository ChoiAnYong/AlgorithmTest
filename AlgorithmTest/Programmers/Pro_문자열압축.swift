//
//  Pro_문자열압축.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/12/25.
//

import Foundation

func solution(_ s:String) -> Int {
    func slice(_ n: Int) -> [String] {
        var result: [String] = []
        var tmp: String = ""
        
        for ch in s {
            tmp += String(ch)
            if tmp.count == n {
                result.append(tmp)
                tmp = ""
            }
        }
        
        if tmp != "" {
            result.append(tmp)
        }
        
        return result
    }
    
    func compression(_ arr: [String]) -> String {
        var count: Int = 1
        var tmp: String = ""
        var result: String = ""
        
        for str in arr {
            if tmp != str {
                result = count == 1 ? "\(result)\(tmp)" : "\(result)\(count)\(tmp)"
                tmp = str
                count = 1
            } else {
                count += 1
            }
        }
        
        result = count == 1 ? "\(result)\(tmp)" : "\(result)\(count)\(tmp)"
        
        return result
    }
    
    var result: Int = Int.max
    
    if s.count < 3 {
        return s.count
    }
    
    for i in 1...s.count/2 {
        result = min(compression(slice(i)).count, result)
    }
    
    return result
}

print(solution("a"))
