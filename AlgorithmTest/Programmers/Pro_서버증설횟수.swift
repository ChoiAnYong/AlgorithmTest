//
//  Pro_서버증설횟수.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/20/25.
//

import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var server: [Int: Int] = [:]
    var addCount: Int = 0
    var acceptablePerson: Int = m
    
    for i in 0..<players.count {
        if let removeServerCount = server[i] {
            acceptablePerson -= removeServerCount * m
        }
        
        if acceptablePerson <= players[i] {
            let person = players[i] - acceptablePerson
            let count = person / m + 1
            addCount += count
            acceptablePerson = acceptablePerson + count * m
            server[i + k, default: 0] += count
        }
    }
        
    return addCount
}
