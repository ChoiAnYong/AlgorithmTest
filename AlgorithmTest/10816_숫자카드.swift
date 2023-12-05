//
//  10816_숫자카드.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/5/23.
//

//Dictionary를 사용하면 배열안에있는 숫자, 문자를 찾고 수를 세는데 유용하다
import Foundation

let n: Int = Int(readLine()!)!
let nList = readLine()!.split(separator: " ").map { Int(String($0))! }

let m: Int = Int(readLine()!)!
let mList = readLine()!.split(separator: " ").map { Int(String($0))! }

var dic = [Int: Int]()
var result: [Int] = []

nList.forEach { 
    //딕셔너리 dic의 키들 중에서 현재 루프에서 주어진 값 $0을 가진 키가 있는지를 확인
    if dic.keys.contains($0) {
        dic[$0]! += 1 //해당 키가 있으므로 해당 키의 값을 증가
    } else {
        dic[$0] = 1 //없으므로 새로운 키를 추가하고 값을 1로 설정
    }
}

mList.forEach { 
    if dic.keys.contains($0) {
        result.append(dic[$0]!) //키 값은 옵셔널을 가지므로 강제로 추출한다.
    } else {
        result.append(0)
    }
}

print(result.map{ String($0) }.joined(separator: " ")) //joined(separator: " ")는 배열의 각 요소들을 하나의 문자열로 결합하는데, 이때 각 요소들 사이에 공백(" ")을 넣습니다

