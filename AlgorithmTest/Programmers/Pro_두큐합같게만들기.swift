//
//  Pro_두큐합같게만들기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/13/25.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1Sum = queue1.reduce(0, +)
    var q2Sum = queue2.reduce(0, +)
    let target = (q1Sum + q2Sum) / 2
    let queue = queue1 + queue2
    var start = 0
    var end = queue1.count - 1
    var result = 0
    
    if (q1Sum + q2Sum) % 2 != 0 {
        return -1
    }
    
    while start <= end && end < queue.count - 1 {
        if q1Sum == target {
            break
        } else if q1Sum < target {
            end += 1
            q1Sum += queue[end]
        } else {
            q1Sum -= queue[start]
            start += 1
        }
        result += 1
    }
    
    if q1Sum != target {
        return -1
    } else {
        return result
    }
}
