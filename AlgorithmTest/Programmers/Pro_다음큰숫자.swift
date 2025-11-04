//
//  Pro_다음큰숫자.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/4/25.
//

import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = n + 1
    let oneCount = String(n, radix: 2).filter { $0 == "1" }.count
 
    func check(_ a: Int) -> Bool {
        let aOneCount = String(a, radix: 2).filter { $0 == "1" }.count
    
        return oneCount == aOneCount ? true : false
    }
    
    while !check(answer) {
        answer += 1
    }
    
    return answer
}
