//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/28/23.
//

import Foundation

let num = Int(readLine()!)!
var list: [Int] = [Int]()

for _ in 0..<num {
    let menu = readLine()!.split(separator: " ").map {
        Int(String($0))!
    }
    
    switch menu[0] {
    case 1:
        list.append(menu[1])
    case 2:
        if list.isEmpty == true {
            print("-1")
        } else {
            print(list.last!)
            list.removeLast()
        }
    case 3:
        print(list.count)
    case 4:
        list.isEmpty == true ? print("1") : print("0")
    case 5:
        list.isEmpty == true ? print("-1") : print(list.last!)
    default: break
    }
}

