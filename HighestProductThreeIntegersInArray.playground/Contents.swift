//: Playground - noun: a place where people can play

import UIKit

func threeHighestProduct(array: [Int]) -> (Int) {
    let a = array[0]
    let b = array[1]
    let c = array[2]
    var highest = max(a, b)
    var lowest = min(a,b)
    var highestProduct = a * b * c
    var highestProduct2 = a * b
    var lowestProduct2 = a * b
    var index = 2
    while index < array.count {
        let current = array[index]
        highestProduct = max(highestProduct, current * highestProduct2, current * lowestProduct2)
        highestProduct2 = max(highestProduct2, current * highest, current * lowest)
        lowestProduct2 = min(lowestProduct2, current * highest, current * lowest)
        highest = max(highest,current)
        lowest = min(lowest,current)
        index += 1
    }
    return (highestProduct)
}


let test = [1,10,-5,1,-100]
//let test = [-10,-10,1,3]
//let test = [4,7,12,-8,9,3,-12]
let result = threeHighestProduct(array: test)

