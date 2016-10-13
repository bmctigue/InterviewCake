//: Playground - noun: a place where people can play

import UIKit

var possibilitiesHash: [String:Int] = [:]

func factorDenominations(amountLeft: Int, denominations: [Int],  currentIndex: Int) -> Int {
    var numPossibilities = 0
    var amountLeft = amountLeft
    var currentCoin: Int = 0
    
    if amountLeft == 0 {
        return 1
    }
    if amountLeft < 0 {
        return 0
    }
    if currentIndex == denominations.count {
        return 0
    }
    let denomArray = Array(denominations[currentIndex...denominations.count-1])
    print ("checking ways to make \(amountLeft) with \(denomArray)")
    var hashKeyArray: [Int] = [amountLeft]
    hashKeyArray.append(contentsOf: denomArray)
    let possibilities = possibilitiesHash[hashKeyArray.description]
    if let possibilities = possibilities {
        return possibilities
    }
    currentCoin = denominations[currentIndex]
    numPossibilities = 0
    while amountLeft >= 0 {
        numPossibilities += factorDenominations(amountLeft: amountLeft, denominations: denominations, currentIndex: currentIndex+1)
        amountLeft -= currentCoin
    }
    possibilitiesHash[hashKeyArray.description] = numPossibilities
    return numPossibilities
}

var amount = 4
var denoms = [1,2,3]

let results = factorDenominations(amountLeft: amount, denominations: denoms, currentIndex: 0)
print ("possibilitiesHash \(possibilitiesHash)")
