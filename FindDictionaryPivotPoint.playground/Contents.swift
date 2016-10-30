//: Playground - noun: a place where people can play

import UIKit

func findPivot(stringArray: [String]) -> Int {
    var start = 0
    var end = stringArray.count - 1
    var pivot = (end - start)/2
    var currentString = stringArray[pivot]
    var firstPivot = currentString < stringArray[pivot-1]
    var afterPivot = currentString < stringArray[pivot+1]
    while !(firstPivot && afterPivot) {
        if currentString > stringArray[0] {
            start = pivot
        } else {
            end = pivot
        }
        pivot = start + (end - start)/2
        if pivot == start {
            pivot -= 1
            break
        }
        if pivot == end {
            pivot += 1
            break
        }
        currentString = stringArray[pivot]
        print("end: \(end)")
        print("start: \(start)")
        print("pivot: \(pivot)")
        print("currentString: \(currentString)")
        print("stringArray[pivot-1]: \(stringArray[pivot-1])")
        print("stringArray[pivot+1]: \(stringArray[pivot+1])")
        print("********")
        firstPivot = currentString < stringArray[pivot-1]
        afterPivot = currentString < stringArray[pivot+1]
    }
    print("pivotString: \(stringArray[pivot])")
    return pivot
}

var testArray: Array<String> = []
testArray = ["asymptote"]
testArray = ["xenoepist","asymptote","babka"]
testArray = ["asymptote","babka","xenoepist"]
testArray = ["ptolemaic",
             "rabbit",
             "rescue",
             "retrograde",
             "sexy",
             "stampede",
             "supplant",
             "undulate",
             "xenoepist",
             "asymptote",
             "babka",
             "banoffee",
             "engender",
             "karpatka",
             "othellolagkage"]
findPivot(stringArray: testArray)
"banoffee" < "ptolemaic"
