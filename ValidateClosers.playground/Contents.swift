//: Playground - noun: a place where people can play

import UIKit

func findClosing(stringArray: [String]) -> Bool {
    var stack: [String] = []
    var endIndex: Int = 0
    var tempChar = ""
    let validCharHash = ["(":")","{":"}","[":"]"]

    while endIndex < stringArray.count {
        tempChar = stringArray[endIndex]
        if validCharHash.keys.contains(tempChar) {
            stack.append(tempChar)
        } else if validCharHash[stack.last!] == tempChar {
            stack.popLast()
            if stack.count == 0 {
                break
            }
        }
        endIndex += 1
    }
    if stack.count > 0 || endIndex == stringArray.count {
        return false
    }
    return true
}

var message = "{[]()}"
//message = "{ [ ( ] ) }"
//message = "{ [ ] ( ) }"
//message = "{[(])}"
//message = "{[}"
//message = "{"
//message = "{}"
var messageArray = message.characters.map{String($0)}
findClosing(stringArray: messageArray)