//: Playground - noun: a place where people can play

import UIKit

func findClosing(stringArray: [String], startIndex: Int) -> Int? {
    var endIndex: Int = startIndex
    var tempChar = ""
    let startChar = "("
    let endChar = ")"
    var startCharCount = 0

    while endIndex < stringArray.count {
        tempChar = stringArray[endIndex]
        if tempChar == startChar {
            startCharCount += 1
        } else if tempChar == endChar {
            startCharCount -= 1
            if startCharCount == 0 {
                break
            }
        }
        endIndex += 1
        print(startCharCount)
    }
    if startCharCount > 0 || endIndex == startIndex {
        return nil
    }
    return endIndex
}

var message = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
//message = "Sometimes (when"
//message = "Sometimes (when I nest them (my parentheticals)"
//message = "Sometimes (when I nest them (my parentheticals))"
var messageArray = message.characters.map{String($0)}
findClosing(stringArray: messageArray, startIndex: 10)

