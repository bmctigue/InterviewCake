//: Playground - noun: a place where people can play

import UIKit

func nthFibonacci(n: Int) -> Int {
    var preceding = 0
    var current = 1
    var temp = 0
    var i = 1
    while i < n {
        temp = preceding + current
        preceding = current
        current = temp
        i += 1
    }
    return current
}

nthFibonacci(n: 8)


var memo: Dictionary<Int,Int> = [:]
var result = 0
func recursiveNthFibonacci(n: Int) -> Int {
    switch n {
    case 0:
        return 0
    case 1:
        return 1
    default:
        if memo[n] != nil {
            return memo[n]!
        }
        result = recursiveNthFibonacci(n: n-1) + recursiveNthFibonacci(n: n-2)
        memo[n] = result
        return result
    }
}

recursiveNthFibonacci(n: 8)