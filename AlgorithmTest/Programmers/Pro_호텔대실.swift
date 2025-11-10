//
//  Pro_호텔대실.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/10/25.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    let times = book_time.map { arr -> [Int] in
        let startSplit = arr[0].split(separator: ":").map { Int($0)! }
        let endSplit = arr[1].split(separator: ":").map { Int($0)! }
        let start = startSplit[0] * 60 + startSplit[1]
        let end = endSplit[0] * 60 + endSplit[1] + 10
        return [start, end]
    }.sorted { $0[0] < $1[0] }
    
    var rooms: [[Int]] = []
    
    for time in times {
        var check = false
        for i in 0..<rooms.count {
            if  rooms[i].last! <= time[0] {
                rooms[i].append(contentsOf: time)
                check = true
                break
            }
        }
        
        if !check {
            rooms.append(contentsOf: [time])
        }
    }
    
    return rooms.count
}
