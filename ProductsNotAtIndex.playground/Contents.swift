//: Playground - noun: a place where people can play

import UIKit

//To find the products of all the integers except the integer at each index, we'll go through our list greedily ↴ twice. First we get the products of all the integers before each index, and then we go backwards to get the products of all the integers after each index.
//
//When we multiply all the products before and after each index, we get our answer—the products of all the integers except the integer at each index!

func combineElements(array: [Int]) -> [Int] {
    var index = 0
    var resultArray: [Int] = []
    var productSoFar = 1
    
    // create
    
    for _ in array {
        resultArray.append(productSoFar)
        productSoFar *= array[index]
        index += 1
    }
    
    productSoFar = 1
    index = array.count - 1
    for _ in array {
        resultArray[index] *= productSoFar
        productSoFar *= array[index]
        index -= 1
    }
    
    return resultArray
}

let test = [3,1,2,5,6,4]
let result = combineElements(array: test)
