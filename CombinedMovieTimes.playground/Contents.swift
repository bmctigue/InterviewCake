//: Playground - noun: a place where people can play

import UIKit


func moviesAddUpToFlight(flightLength: Int, movieLengths: [Int]) -> Bool {
    var movieSet: Set<Int> = []
    var currentLength = 0
    var i = 0
    while i < movieLengths.count {
        currentLength = flightLength - movieLengths[i]
        if currentLength != movieLengths[i] && movieSet.contains(currentLength) {
            return true
        }
        movieSet.insert(movieLengths[i])
        i += 1
    }
    return false
}

var testMovies = [7,15,6,5,27,10]
moviesAddUpToFlight(flightLength: 30, movieLengths: testMovies)
