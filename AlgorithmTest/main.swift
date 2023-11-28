//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 11/27/23.
//

import Foundation

var alpha = [Int](repeating: 0, count: 26)//배열 크기를 26으로 하고 0으로 초기화
let sentence = readLine()!.uppercased().map{String($0)}//입력 받은 문자를 대문자로 변환하여 받음

for ch in sentence {
    let index: Int = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar("A").value)//Int(UnicodeSccalar()!.value)를 쓰면 아스키코드값을 알 수 있다.
    alpha[index] += 1
}

var maxIndex: Int = 0
var check: Bool = false
// 배열의 인덱스를 알기 위해 .enumerated()를 사용한다. 인덱스 $0.offset, 값 $0.element $0.0 $0.1로 줄여쓸 수 있다.
alpha.enumerated().forEach {
    if alpha[maxIndex] < $0.1 {
        maxIndex = $0.0
    }
}

alpha.enumerated().forEach {
    if alpha[maxIndex] == $0.1 && $0.0 != maxIndex {
        check = true
    }
}

let result = String(UnicodeScalar(65 + maxIndex)!)//String(UnicodeScalar()!)를 쓰면 아스키코드를 문자로 변환할 수 있다.
check ? print("?") : print(result)
