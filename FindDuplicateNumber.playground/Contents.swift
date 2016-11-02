//: Playground - noun: a place where people can play

import UIKit

func findDuplicateWithAddition(integerArray: [Int]) -> Int? {
    let expectedTotal = (integerArray.first! + integerArray.last!) * (integerArray.count/2)
    var total: Int = 0
    
    var i = 0
    while i < integerArray.count {
        total = total + integerArray[i]
        i += 1
    }
    if total > expectedTotal {
        return total - expectedTotal
    }
    return nil
}

func findDuplicateWithXOR(integerArray: [Int]) -> Int? {
    var result: Int = integerArray[0]
    var oldResult = result
    
    var i = 1
    while i < integerArray.count {
        result = result^integerArray[i]^i
        if result == oldResult {
            return integerArray[i]
        } else {
            oldResult = result
        }
        i += 1
    }
    return nil
}

var integerArray = [1,2,3,4,5,5,6,7,8]
findDuplicateWithXOR(integerArray: integerArray)
findDuplicateWithAddition(integerArray: integerArray)