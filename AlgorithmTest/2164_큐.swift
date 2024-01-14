//
//  2164_큐.swift
//  AlgorithmTest
//
//  Created by 최안용 on 1/14/24.
//

import Foundation

class Queue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init(_ queue: [T]) {
        self.enQueue = queue
    }
    
    func push(_ element: T) {
        enQueue.append(element)
    }
    
    func pop() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}

let n = Int(readLine()!)!
var arr = Array(1...n)

var queue: Queue = Queue<Int>(arr)

while queue.count != 1 {
    let _ = queue.pop()
    queue.push(queue.pop())
}

print(queue.pop())
