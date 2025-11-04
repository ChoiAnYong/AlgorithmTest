//
//  Pro_[1차]캐시.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/4/25.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String: Int] = [:]
    var time: Int = 0
    
    for i in 0..<cities.count {
        if cacheSize == 0 {
            time += 5
            continue
        }
        
        let currentKey = cities[i].lowercased()
        
        if let _ = cache[currentKey] {
            time += 1
            cache[currentKey] = i
        } else {
            if cache.count == cacheSize {
                 var min = Int.max
                var removeKey = ""
                for (key, value) in cache {
                    if value < min {
                        min = value
                        removeKey = key
                    }
                }
                
                cache.removeValue(forKey: removeKey)
            }
            
            cache[currentKey] = i
            time += 5
        }
    }
    
    return time
}
