//
//  Pro_Process.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/15/25.
//

import Foundation

struct Process {
    let priority: Int
    let location: Int
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue: [Process] = []
    var completeQueue: [Process] = []
    
    for i in 0..<priorities.count {
        queue.append(.init(priority: priorities[i], location: i))
    }
    
    while !queue.isEmpty {
        var process = queue.first!
        var index = -1
        
        for i in 0..<queue.count {
            if process.priority < queue[i].priority {
                process = queue[i]
                index = i
            }
        }
        
        if index != -1 {
            for _ in 0..<index {
                let temp = queue.removeFirst()
                queue.append(temp)
            }
        } else {
            index = 0
        }
        
        _ = queue.removeFirst()
        completeQueue.append(process)
    }
    
    let result = completeQueue.firstIndex(where: { $0.location == location })
    
    return result! + 1
}
