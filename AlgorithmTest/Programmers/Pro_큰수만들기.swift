//
//  Pro_큰수만들기.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/9/25.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var count = 0
    var stack: [Character] = []
    
    for num in number {
        while !stack.isEmpty, stack.last! < num, count != k {
            stack.removeLast()
            count += 1
        }
        
        stack.append(num)
    }
    
    return String(String(stack).prefix(stack.count-(k-count)))
}
