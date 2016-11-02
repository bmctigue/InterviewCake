//: Playground - noun: a place where people can play

import UIKit

func shuffle(strings: [String]) -> [String] {
    var strings = strings
    var tempString = ""
    var randomIndex = 0
    var i = 0
    while i < strings.count-1 {
        randomIndex = randomNumber(floor: i, ceiling: strings.count)
        tempString = strings[i]
        strings[i] = strings[randomIndex]
        strings[randomIndex] = tempString
        i += 1
    }
    return strings
}

func randomNumber(floor: Int, ceiling: Int) -> Int {
    return Int(Int(arc4random_uniform(UInt32(ceiling - floor))) + floor)
}

var strings = ["a","b","c","d","e"]
strings = ["a","b","c"]
shuffle(strings: strings)