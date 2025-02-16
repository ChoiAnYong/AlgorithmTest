//
//  Pro_Carpet.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/16/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var yellowWidth = yellow
    var yellowHeight = 1
    
    var yellowArr: [[Int]] = []
    var result: [Int] = []
    
    while yellowWidth >= yellowHeight {
        yellowArr.append([yellowWidth, yellowHeight])
        yellowHeight += 1
        yellowWidth = yellow / yellowHeight
    }
    
    for i in 0..<yellowArr.count {
        var brownWidth = yellowArr[i][0] + 2
        var brownHeight = yellowArr[i][1] + 2
        
        if brownWidth * brownHeight - yellowArr[i][0] * yellowArr[i][1] == brown {
            result = [brownWidth, brownHeight]
        }
    }
    
    return result
}
