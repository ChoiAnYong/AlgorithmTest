//
//  Pro_Babbling.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/10/25.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    let possible = ["aya", "ye", "woo", "ma"]
    var count = 0
    
    for word in babbling {
        var temp = word
        var isValid = true
        
        for sound in possible {
            if temp.contains(sound + sound) {
                isValid = false
                break
            }
        }
        
        if !isValid {
            continue
        }
        
        for sound in possible {
            temp = temp.replacingOccurrences(of: sound, with: " ")
        }
        
        temp = temp.replacingOccurrences(of: " ", with: "")
        
        if temp.isEmpty {
            count += 1
        }
    }
    
    return count
}

print(solution(["aya", "yee", "u", "maa", "wyeoo"]))
