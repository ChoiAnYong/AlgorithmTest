//
//  Pro_OpenChattingRoom.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/7/25.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    let splitRecord = record.map({ $0.split(separator: " ") })
    var user: [String : String] = [:]
    
    splitRecord.forEach { record in
        if record.count == 3 {
            user[String(record[1])] = String(record[2])
        }
    }
    
    splitRecord.forEach { record in
        guard let name = user[String(record[1])] else { return }
        if record[0] == "Enter" {
            result.append("\(name)님이 들어왔습니다.")
        } else if record[0] == "Leave" {
            result.append("\(name)님이 나갔습니다.")
        }
    }
    
    return result
} 
