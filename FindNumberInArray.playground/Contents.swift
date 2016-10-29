//: Playground - noun: a place where people can play

import UIKit

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

func numberExistsInArray(number: Int, sortedArray: [Int]) -> Bool {
    print("sortedArray: \(sortedArray)")
    var exists = false
    switch sortedArray.count {
    case 0:
        exists = false
    case 1:
        exists = number == sortedArray.first ? true : false
    default:
        let splitArray = sortedArray.split()
        if splitArray.right.count > 0 && number >= splitArray.right.first! {
            exists = numberExistsInArray(number: number, sortedArray: splitArray.right)
        } else {
            exists = numberExistsInArray(number: number, sortedArray: splitArray.left)
        }
        
    }
    return exists
}

var testArray: Array<Int> = []
testArray = [1]
testArray = [2]
testArray = [1,2,3]
testArray = [1,2,3,8,10,11,13,99,102, 113,300,500]
numberExistsInArray(number: 800, sortedArray: testArray)
