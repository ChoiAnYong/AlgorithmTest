//
//  Pro_금과은운반하기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/30/25.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    var low = 0
    var high = 400000000000000 // 최악의 경우 (w = 1, t = 10^5)X2(왕복), g = 10^9, s= 10^9
    
    func isPossible(_ time: Int) -> Bool {
        var total = 0
        var gold = 0
        var silber = 0
        
        for i in 0..<g.count {
            var count = time / (t[i]*2) // time  동안 옮길 수 있는 횟수
            if time % (t[i]*2) >= t[i] { // 마지막에 편도만으로 가능한 경우
                count += 1
            }
            
            let maxMove = min(count * w[i], g[i]+s[i]) // time 동안 옮길 수 있는 최대 무게
            total += maxMove
            
            gold += min(maxMove, g[i])
            silber += min(maxMove, s[i])
        }
        
        return total >= a+b && gold >= a && silber >= b
    }
    
    while low+1 < high {
        let mid = (low + high) / 2
        
        let possible = isPossible(mid)
        
        if possible {
            high = mid
        } else {
            low = mid
        }
    }
    
    return Int64(high)
}
