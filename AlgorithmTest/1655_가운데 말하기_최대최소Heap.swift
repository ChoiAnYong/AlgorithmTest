//
//  1655_가운데 말하기_최대최소Heap.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/6/24.
//

import Foundation

struct Heap<T: Comparable> {
    var element: [T]
    var compare: (T, T) -> Bool
    
    // maxHeap >, minHeap <
    init(compare: @escaping (T, T) -> Bool) {
        self.element = []
        self.compare = compare
    }
    
    var root: T? {
        return element.isEmpty ? nil : element[0]
    }
    
    var isEmpty: Bool {
        return element.isEmpty
    }
    
    // 삽입 시 노드 상승
    mutating func shiftUp(i: Int) {
        var now: Int = i
        
        // 현재 노드가 루트 노드보다 하위 노드일 경우
        while now > 0 {
            // 부모 노드 인덱스
            let parent = (now - 1) / 2
            
            // 부모 노드와 대소비교
            if compare(element[now],element[parent]) {
                element.swapAt(now, parent)
                // 교환 후 현재 노드를 부모 노드가 있던 자리로 옮김
                now = parent
            } else {
                break
            }
        }
    }
    
    // 삭제 시 노드 하강
    mutating func shiftDown(i: Int) {
        var now: Int = i
        
        //자식 노드 인덱스
        var child: Int = now * 2 + 1
        let count: Int = element.count
        
        // 자식 노드가 트리 범위 안에 있을 경우
        while child < count {
            
            // 왼쪽 자식, 오른쪽 자식 둘 다 있을 경우
            if child + 1 < count {
                child = compare(element[child], element[child + 1]) ? child : child + 1
            }
            
            //자식 노드와 대소비교 후 교환
            if compare(element[child], element[now]) {
                element.swapAt(now, child)
                //현재 노드를 자식 노드 인덱스로
                now = child
                child = now * 2 + 1
            } else {
                break
            }
        }
    }
    
    mutating func insert(_ data: T) {
        element.append(data)
        shiftUp(i: element.count - 1)
    }
    
    mutating func delete() -> T? {
        if element.isEmpty {
            return nil
        }
        
        if element.count == 1 {
            return element.removeFirst()
        }
        
        element.swapAt(0, element.count - 1)
        
        let result = element.removeLast()
        shiftDown(i: 0)
        
        return result
    }
}





let N = Int(readLine()!)!

var maxHeap: Heap<Int> = .init(compare: >)
var minHeap: Heap<Int> = .init(compare: <)
var output: String = ""

for i in 1...N {
    let input = Int(readLine()!)!
    
    if i % 2 == 0 {
        minHeap.insert(input)
    } else {
        maxHeap.insert(input)
    }
    
    if minHeap.root == nil {
        output += "\(maxHeap.root!)\n"
        continue
    }
    
    let maxRoot: Int = maxHeap.root!
    let minRoot: Int = minHeap.root!
    
    if maxRoot > minRoot {
        minHeap.element[0] = maxRoot
        maxHeap.element[0] = minRoot
        
        minHeap.shiftDown(i: 0)
        maxHeap.shiftDown(i: 0)
    }
    
    output += "\(maxHeap.root!)\n"
}

print(output)
