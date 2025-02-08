//
//  main.swift
//  AlgorithmTest
//
//  Created by 최안용 on 2/8/25.
//

import Foundation

func solution(_ letter:String) -> String {
    let splitLetter = letter.split(separator: " ")
    let morseDictionary = [
        ".-":"a","-...":"b","-.-.":"c","-..":"d",".":"e","..-.":"f",
        "--.":"g","....":"h","..":"i",".---":"j","-.-":"k",".-..":"l",
        "--":"m","-.":"n","---":"o",".--.":"p","--.-":"q",".-.":"r",
        "...":"s","-":"t","..-":"u","...-":"v",".--":"w","-..-":"x",
        "-.--":"y","--..":"z"
    ]
    var result = ""
    
    splitLetter.forEach { morse in
        if let alph = morseDictionary[String(morse)] {
            result += alph
        }
    }
    
    return result
}
