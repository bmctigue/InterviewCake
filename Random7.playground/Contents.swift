//: Playground - noun: a place where people can play

import UIKit

func randomNumber(floor: Int, ceiling: Int) -> Int {
    return Int(Int(arc4random_uniform(UInt32(ceiling - floor))) + floor)
}

func randomFive() -> Int {
    return randomNumber(floor: 1, ceiling: 6)
}

func randomSeven() -> Int {
    var roll1: Int = 0
    var roll2: Int = 0
    while true {
        roll1 = randomFive()
        roll2 = randomFive()
        let result = (roll1-1) * 5 + (roll2-1) + 1
        if result > 21 {
            continue
        }
        return result % 7 + 1
    }
}

randomSeven()
