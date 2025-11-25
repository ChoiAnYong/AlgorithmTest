//
//  Pro_다리를지나는트럭.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/25/25.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var currentWeight: Int = 0
    var time: Int = 0
    var index: Int = 1
    var queue: [(Int, Int)] = []
    
    queue.append((1, truck_weights[0]))
    currentWeight += truck_weights[0]
    
    while !queue.isEmpty {
        time += 1
        if let truck = queue.first, time - truck.0 >=  bridge_length {
            _ = queue.removeFirst()
            currentWeight -= truck.1
        }
        
        if index < truck_weights.count, currentWeight + truck_weights[index] <= weight {
            queue.append((time, truck_weights[index]))
            currentWeight += truck_weights[index]
            index += 1
        }
    }

    return time
}
