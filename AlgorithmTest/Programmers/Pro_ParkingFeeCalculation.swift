//
//  Pro_ParkingFeeCalculation.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/14/25.
//

import Foundation

struct Info {
    var number: String
    var inTime: [Date]
    var outTime: [Date]
    var fee: Int = 0
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var infos: [Info] = []
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 8)
    
    records.forEach { info in
        let splitInfo = info.split(separator: " ")
        
        guard let index = infos.firstIndex(where: { $0.number == String(splitInfo[1]) }) else {
            if String(splitInfo[2]) == "IN" {
                infos.append(
                    Info(
                        number: String(splitInfo[1]),
                        inTime: [dateFormatter.date(from: String(splitInfo[0]))!],
                        outTime: []
                    )
                )
            }
            return
        }
        
        if String(splitInfo[2]) == "IN" {
            infos[index].inTime.append(dateFormatter.date(from: String(splitInfo[0]))!)
        } else {
            infos[index].outTime.append(dateFormatter.date(from: String(splitInfo[0]))!)
        }
    }
    
    for i in 0..<infos.count {
        if infos[i].inTime.count != infos[i].outTime.count {
            infos[i].outTime.append(dateFormatter.date(from: "23:59")!)
        }
        
        var time = 0
        for j in 0..<infos[i].outTime.count {
            time += Int(infos[i].outTime[j].timeIntervalSince(infos[i].inTime[j])) / 60
        }
   
        if time-fees[0] < 0 {
            infos[i].fee = fees[1]
        } else {
            if (time - fees[0]) % fees[2] != 0 {
                infos[i].fee = fees[1] + ((time-fees[0])/fees[2] + 1) * fees[3]
            } else {
                infos[i].fee = fees[1] + (time-fees[0])/fees[2] * fees[3]
            }
        }
    }
    
    infos.sort(by: { $0.number<$1.number})
    
    return infos.map( { $0.fee } )
}
