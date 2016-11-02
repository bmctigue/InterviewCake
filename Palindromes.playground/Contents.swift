//: Playground - noun: a place where people can play

import UIKit

func palindrome(message: String) -> Bool {
    let stringArray = message.characters.map{String($0)}
    var characterSet: Set<String> = []
    var endIndex: Int = 0
    var tempChar = ""
    
    switch stringArray.count {
    case 0:
        return false
    case 1:
        return true
    default:
        while endIndex < stringArray.count {
            tempChar = stringArray[endIndex]
            if characterSet.contains(tempChar) {
                characterSet.remove(tempChar)
            } else {
                characterSet.insert(tempChar)
            }
            
            endIndex += 1
        }
        if characterSet.count < 2 {
            return true
        }
        return false
    }
}

palindrome(message: "")
palindrome(message: "a")
palindrome(message: "civic")
palindrome(message: "ivicc")
palindrome(message: "civil")
palindrome(message: "livci")
