//: Playground - noun: a place where people can play

import UIKit


func sortUnsortedScores(unsortedScores: [Int], highestPossibleScore: Int) -> [Int] {
    var scoresCount: [Int] = [Int](repeatElement(0, count: highestPossibleScore))
    for item in unsortedScores {
        scoresCount[item] = scoresCount[item] + 1
    }
    var sortedScores: [Int] = []
    var i = 0
    var j = 0
    while i < highestPossibleScore {
        j = 0
        while j < scoresCount[i] {
            sortedScores.append(i)
            j += 1
        }
        i += 1
    }
    return sortedScores
}

var unsortedScores = [37, 89, 41, 65, 91, 53, 41]
sortUnsortedScores(unsortedScores: unsortedScores, highestPossibleScore: 100)
