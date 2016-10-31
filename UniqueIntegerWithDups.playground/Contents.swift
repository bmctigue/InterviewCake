//: Playground - noun: a place where people can play

import UIKit


func uniqueID(ids: [Int]) -> Int? {
    var idHash: Set<Int> = []
    for item in ids {
        if idHash.contains(item) {
            idHash.remove(item)
        } else {
            idHash.insert(item)
        }
    }
    return idHash.first
}

let ids = [1,2,2,1,3,5,3,6,5,6,7]
uniqueID(ids: ids)

// you can do this in O(1) space by XOR the numbers until the single value remains.




