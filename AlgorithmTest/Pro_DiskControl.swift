//
//  Pro_DiskControl.swift
//  AlgorithmTest
//
//  Created by 최안용 on 7/10/24.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var jobs = jobs.sorted { $0[0] < $1[0] }
    var heap = [(Int, Int)]()
    var time = 0
    var totalResponseTime = 0
    var index = 0

    while index < jobs.count || !heap.isEmpty {
        while index < jobs.count && jobs[index][0] <= time {
            heap.append((jobs[index][1], jobs[index][0]))
            index += 1
        }
                
        if !heap.isEmpty {
            heap.sort { $0.0 < $1.0 }
            let (duration, requestTime) = heap.removeFirst()
            time += duration
            totalResponseTime += time - requestTime
        } else {
            time = jobs[index][0]
        }
    }

    return totalResponseTime / jobs.count
}
