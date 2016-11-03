//: Playground - noun: a place where people can play

import UIKit

func mergeArrays(array1: [Int], array2: [Int]) -> [Int] {
    var array1 = array1
    var array2 = array2
    var mergedArrays: [Int] = []
    let totalCount = array1.count + array2.count
    
    while mergedArrays.count < totalCount {
        if array1.count == 0 {
            mergedArrays.append(contentsOf: array2)
        } else if array2.count == 0 {
            mergedArrays.append(contentsOf: array1)
        } else {
            if array1[0] <= array2[0] {
                mergedArrays.append(array1.remove(at:0))
            } else {
                mergedArrays.append(array2.remove(at:0))
            }
        }
    }
    return mergedArrays
}

var array1 = [3, 4, 6, 10, 11, 15]
var array2 = [1, 5, 8, 12, 14, 19]
//array2 = [1, 5, 8]
mergeArrays(array1: array1, array2: array2)