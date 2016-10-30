//: Playground - noun: a place where people can play

import UIKit


// This is wrong, it won't work. May want to revisit, but too complex for an interview question

var usedCakes: Set<Int> = []
func cakesInDuffelBag(cakes: [[Int]], capacity: Int, maxValue: Int) -> Int {
    var maxValue = maxValue
    var maxCakeTuple = (currentCakeMax:0,capacityRemaining:0)
    var capacityRemaining = capacity
    for cake in cakes {
        if !usedCakes.contains(cake.first!) && cake.first! != 0 && cake.last! != 0 {
            var currentCakeMax = 0
            (currentCakeMax, capacityRemaining) = cakeMaxValue(cake: cake, capacity: capacity)
            if currentCakeMax > maxCakeTuple.currentCakeMax {
                maxCakeTuple = (currentCakeMax, capacityRemaining)
                usedCakes.insert(cake.first!)
            }
        }
    }
    if maxCakeTuple.currentCakeMax != 0 {
        maxValue += cakesInDuffelBag(cakes: cakes, capacity: maxCakeTuple.capacityRemaining, maxValue: maxValue)
    }
    maxValue += maxCakeTuple.currentCakeMax
    return maxValue
}

func cakeMaxValue(cake:[Int], capacity: Int) -> (Int,Int) {
    let weight = cake.first!
    let value = cake.last!
    let maxValue = (capacity/weight) * value
    let capacityRemaining = capacity % weight
    return (maxValue,capacityRemaining)
}

var cakes = [[7,160],[3,90],[2,15]]
//cakes = [[7,160],[3,90],[2,15],[0,0]]
//cakes = [[7,160],[3,90],[2,15],[0,15], [8,0]]
//cakes = [[7,160],[3,90]]
//cakes = [[7,160]]
//cakes = [[7,160],[2,15]]
//cakes = [[1,30],[50,200]]
cakes = [[3,40],[5,70]] // this set produces the wrong result
var capacity = 8
cakesInDuffelBag(cakes:cakes, capacity: capacity, maxValue: 0)
