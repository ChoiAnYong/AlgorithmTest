//
//  Pro_emoticonSaleEvent.swift
//  AlgorithmTest
//
//  Created by 최안용 on 4/24/25.
//

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var sale: [Int] = Array(repeating: 0, count: emoticons.count)
    let percent = [10, 20, 30, 40]
    var answer = [0,0]
    
    func dfs(_ depth: Int) {
        if depth == emoticons.count {
            var plus = 0
            var amount = 0
            
            users.forEach { user in
                var total = 0
                
                zip(sale, emoticons).forEach {
                    if user[0] <= $0.0 {
                        total += ($0.1 * (100 - $0.0) / 100)
                    }
                }
                           
                if total >= user[1] {
                    plus += 1
                    total = 0
                }
                           
                amount += total
            }
            
            if plus > answer[0] {
                answer[0] = plus
                answer[1] = amount
            } else if plus == answer[0] && amount > answer[1] {
                answer[1] = amount
            }
            
            return
        }
        
        percent.forEach {
            sale[depth] = $0
            dfs(depth + 1)
        }
    }
    
    dfs(0)
    
    return answer
}
