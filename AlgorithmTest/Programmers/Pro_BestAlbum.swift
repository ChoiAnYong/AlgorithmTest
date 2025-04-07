//
//  Pro_BestAlbum.swift
//  AlgorithmTest
//
//  Created by 최안용 on 4/7/25.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var answer:[Int] = []
    var dic = [String: [(Int, Int)]]()
    var sortedKey:[(String, Int)] = []
    
    for i in 0..<genres.count {
        dic[genres[i], default: []].append((i, plays[i]))
    }
    
    for i in 0..<dic.count {
        let key = Array(dic.keys)[i]
        var sum = 0
        dic[key]?.sort(by: { $0.1 > $1.1 })
        dic[key]?.forEach({ count in
            sum += count.1
        })
        sortedKey.append((key, sum))
    }
    
    sortedKey.sort(by: { $0.1 > $1.1})
    
    sortedKey.forEach { key, _ in
        guard let musicList = dic[key] else {
            return
        }
        
        if musicList.count < 2 {
            answer.append(musicList[0].0)
        } else {
            answer.append(musicList[0].0)
            answer.append(musicList[1].0)
        }
    }

    return answer
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
