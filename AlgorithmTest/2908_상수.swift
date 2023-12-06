//
//  2908_상수.swift
//  AlgorithmTest
//
//  Created by 최안용 on 12/6/23.
//

import Foundation

var input = readLine()!.split(separator: " ")

var first = Int(String(input[0].reversed()))!
var second = Int(String(input[1].reversed()))!

first > second ? print(first) : print(second)
