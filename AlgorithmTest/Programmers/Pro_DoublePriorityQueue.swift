//
//  Pro_DoublePriorityQueue.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/21/25.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    for operation in operations {
        let split = operation.split(separator: " ").map { String($0) }
        
        if split[0] == "I" {
            let num = Int(split[1])!
            queue.append(num)
            queue.sort()
        } else if split[0] == "D" {
            let num = Int(split[1])!
            
            if !queue.isEmpty {
              if num == 1 {
                    queue.removeLast()
            } else {
                    queue.removeFirst()
                }
            }
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}
