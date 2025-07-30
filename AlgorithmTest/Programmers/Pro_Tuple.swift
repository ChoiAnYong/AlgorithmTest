//
//  Pro_Tuple.swift
//  AlgorithmTest
//
//  Created by 최안용 on 5/20/25.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    
    s.trimmingCharacters(in: ["{", "}"])
        .components(separatedBy: "},{")
        .map {
            $0.components(separatedBy: ",")
                .compactMap { Int(String($0)) }
        }
        .sorted { $0.count < $1.count }
        .forEach {
            $0.forEach {
                if !answer.contains($0) {
                    answer.append($0)
                }
            }
        }

    return answer
}
