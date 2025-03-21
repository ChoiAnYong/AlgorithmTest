//
//  Pro_SkillTree.swift
//  AlgorithmTest
//
//  Created by 최안용 on 3/22/25.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skillTrees = skill_trees.map { $0.filter { skill.contains($0) }.map { $0 } }
    let splitSkill = skill.map { $0 }
    var count = 0
    
    for skill in skillTrees {
        var indexList: [Int] = []
        var check = true
        for i in 0..<skill.count {
            let index = splitSkill.firstIndex(of: skill[i])!
            indexList.append(Int(index))
        }
        
        if indexList.isEmpty {
            continue
        }
        
        if indexList[0] != 0 {
            continue
        }
        
        for i in 0..<indexList.count-1 {
            if indexList[i]>indexList[i+1] || indexList[i+1] - indexList[i] != 1 {
                check = false
                break
            }
        }
        
        if check { count += 1 }
    }
    
    return count
}
