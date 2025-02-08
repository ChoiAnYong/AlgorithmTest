//
//  Pro_ArmyOfAnts.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/8/25.
//

import Foundation

func solution(_ hp:Int) -> Int {
    var result = 0
    var remainHp = hp
    
    result += remainHp / 5
    
    remainHp %= 5
    
    result += remainHp / 3
    
    remainHp %= 3
    
    result += remainHp
    
    
    return result
}
