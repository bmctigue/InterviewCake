//: Playground - noun: a place where people can play

import UIKit


func reverseString(stringArray: [String]) -> [String] {
    
    if stringArray.count < 2 {
        return stringArray
    }
    
    var reversedArray = stringArray
    var startIndex = 0
    var endIndex = reversedArray.count - 1
    var tempChar = ""
    
    while endIndex >= startIndex {
        if endIndex == startIndex {
            break
        }
        tempChar = reversedArray[startIndex]
        reversedArray[startIndex] = reversedArray[endIndex]
        reversedArray[endIndex] = tempChar
        startIndex += 1
        endIndex -= 1
    }
    
    return reversedArray
}

var stringArray = ["a","b","c"]
//stringArray = []
//stringArray = ["a"]
//stringArray = ["a","b"]
//stringArray = ["a","b","c","d"]
//stringArray = ["a","b","c","d","e"]

reverseString(stringArray: stringArray)