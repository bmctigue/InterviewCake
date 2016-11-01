//: Playground - noun: a place where people can play

import UIKit

func reverseWords(stringArray: [String]) -> [String] {
    var stringArray = stringArray
    var startIndex = 0
    var endIndex = stringArray.count - 1
    
    stringArray = reverseString(stringArray: stringArray, startIndex: startIndex, endIndex: endIndex)
    
    endIndex = 1
    
    while endIndex < stringArray.count - 1 {
        if stringArray[endIndex] == " " {
            stringArray = reverseString(stringArray: stringArray, startIndex: startIndex, endIndex: endIndex-1)
            endIndex += 1
            startIndex = endIndex
        }
        endIndex += 1
    }
    stringArray = reverseString(stringArray: stringArray, startIndex: startIndex, endIndex: endIndex)
    return stringArray
}

func reverseString(stringArray: [String], startIndex: Int, endIndex: Int) -> [String] {
    var stringArray = stringArray
    
    if stringArray.count < 2 {
        return stringArray
    }
    
    var startIndex = startIndex
    var endIndex = endIndex
    var tempChar = ""
    
    while endIndex >= startIndex {
        if endIndex == startIndex {
            break
        }
        tempChar = stringArray[startIndex]
        stringArray[startIndex] = stringArray[endIndex]
        stringArray[endIndex] = tempChar
        startIndex += 1
        endIndex -= 1
    }
    return stringArray
}

var message = "find you will pain only go you recordings security the into if"
//message = ""
//message = "find if"
//message = "find only into if"
var messageArray = message.characters.map{String($0)}
messageArray = reverseWords(stringArray: messageArray)
messageArray.joined()

