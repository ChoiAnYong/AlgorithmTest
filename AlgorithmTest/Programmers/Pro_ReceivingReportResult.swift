//
//  Pro_ReceivingReportResult.swift
//  AlgorithmTest
//
//  Created by 최안용 on 4/28/25.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var list: [String: [String]] = [:]
    var alarm: [String: Int] = [:]
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    
    report.forEach { repo in
        let split = repo.split(separator: " ").map { String($0) }
        list[split[1], default: []].append(split[0])
    }
    
    list.forEach { info in
        var report = Set(info.value)
        
        if report.count >= k {
            report.forEach {
                alarm[$0, default: 0] += 1
            }
        }
    }
    
    for i in 0..<id_list.count {
        if let count = alarm[id_list[i]] {
            result[i] = count
        }
    }
    
    
    return result
}
