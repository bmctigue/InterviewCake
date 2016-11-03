//: Playground - noun: a place where people can play

import UIKit

func randomNumber(floor: Int, ceiling: Int) -> Int {
    return Int(Int(arc4random_uniform(UInt32(ceiling - floor))) + floor)
}

func randomSeven() -> Int {
    return randomNumber(floor: 1, ceiling: 8)
}

func randomFive() -> Int {
    var random = randomSeven()
    print(random)
    if random > 5 {
        random = randomFive()
    }
    return random
}

randomFive()