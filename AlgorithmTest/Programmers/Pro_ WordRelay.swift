//
//  Pro_ WordRelay.swift
//  AlgorithmTest
//
//  Created by 최안용 on 8/3/25.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var answer: [String] = []
    var person = 0
    var count = 1
    
    for i in 0..<words.count {
        if !answer.contains(words[i]) {
            if answer.count >= 1 {
                if answer[i-1].suffix(1) != words[i].prefix(1) {
                    break
                }
            }
            answer.append(words[i])
            person = (person + 1) % n
            if person == 0 {
                count += 1
            }
        } else {
            break
        }
    }
    
    if answer.count == words.count {
        return [0,0]
    } else {
        print(answer)
        return [person+1, count]
    }
}
