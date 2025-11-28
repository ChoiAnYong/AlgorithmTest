//
//  Pro_뉴스클러스터링.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/28/25.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    func makeDic(_ str: String) -> [String: Int] {
        var strDic: [String: Int] = [:]
        var startIndex = str.startIndex
        var endIndex = str.index(after: startIndex)
        for _ in 0..<str.count-1 {
            let word = String(str[startIndex...endIndex].uppercased())
            if Array(word).filter({ $0.isLetter }).count == 2 {
                strDic[word, default: 0] += 1
            }
            startIndex = endIndex
            endIndex = str.index(after: startIndex)
        }
        
        return strDic
    }
    
    let str1Dic: [String: Int] = makeDic(str1)
    let str2Dic: [String: Int] = makeDic(str2)
    let str1Set = Set(str1Dic.keys)
    let str2Set = Set(str2Dic.keys)
    let intersectionSet = str1Set.intersection(str2Set)
    let unionSet = str1Set.union(str2Set)
    var intersectionCount = intersectionSet.count
    var unionCount = unionSet.count
    
    for key in intersectionSet {
        if let str1Count = str1Dic[key], let str2Count = str2Dic[key], str1Count > 1 || str2Count > 1 {
            let min = str1Count < str2Count ? str1Count : str2Count
            let max = str1Count > str2Count ? str1Count : str2Count
            intersectionCount += min - 1
            unionCount += max - 1
        }
    }
    
    let subtract = unionSet.subtracting(intersectionSet)
    
    for key in subtract {
        if let str1Count = str1Dic[key], str1Count > 1 {
            unionCount += str1Count - 1
        }
        
        if let str2Count = str2Dic[key], str2Count > 1 {
            unionCount += str2Count - 1
        }
    }
    
    if intersectionCount == 0 && unionCount == 0 {
        return 65536
    } else {
        return Int(Double(intersectionCount)/Double(unionCount)*65536)
    }
}
