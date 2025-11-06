//
//  Pro_메뉴리뉴얼.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/5/25.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var menuDic: [String: Int] = [:]
    var answer: [String] = []
    
    func combi(_ index: Int, _ origin: [Character], _ newStr: String) {
        if course.last! < newStr.count {
            return
        }
        
        if course.contains(newStr.count) {
            menuDic[newStr, default: 0] += 1
        }
        
        for i in index..<origin.count {
            let c = origin[i]
            combi(i+1, origin, "\(newStr)\(c)")
        }
    }
    
    for order in orders {
        combi(0, order.sorted(), "")
    }
    
    for num in course {
        let filtered = menuDic.filter { $0.key.count == num && $0.value > 1 }
        if let max = filtered.values.max() {
            let result = filtered.filter { $0.value == max }
            answer.append(contentsOf: result.keys)
        }
    }
    
    return answer.sorted()
}
