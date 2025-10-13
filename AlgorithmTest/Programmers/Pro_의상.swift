//
//  Pro_의상.swift
//  AlgorithmTest
//
//  Created by 최안용 on 10/14/25.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: [String]] = [:]
    var result = 1
    
    clothes.forEach {
        dic[$0[1], default: []].append($0[0])
    }
    
    for (key, value) in dic {
        result *= (value.count + 1)
    }
    
    return result - 1
}
