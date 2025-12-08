//
//  Pro_최댓값과최솟값.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/27/25.
//

func solution(_ s:String) -> String {
    let numbers = s.split(separator: " ").compactMap { Int(String($0))}
    
    return "\(numbers.min()!) \(numbers.max()!)"
}
