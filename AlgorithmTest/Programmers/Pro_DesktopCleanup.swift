//
//  Pro_DesktopCleanup.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/8/25.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let split = wallpaper.map { Array($0).map { String($0) } }
    var xPosition: (Int, Int) = (50, 0)
    var yPosition: (Int, Int) = (50, 0)
    
    for i in 0..<split.count {
        for j in 0..<split[i].count {
            if split[i][j] == "#" {
                if xPosition.0 > j {
                    xPosition.0 = j
                }
                
                if xPosition.1 < j {
                    xPosition.1 = j
                }
                
                if yPosition.0 > i {
                    yPosition.0 = i
                }
                
                if yPosition.1 < i {
                    yPosition.1 = i
                }
            }
        }
    }
    
    return [yPosition.0, xPosition.0, yPosition.1+1, xPosition.1+1]
}
