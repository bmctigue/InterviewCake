//: Playground - noun: a place where people can play

import UIKit

func combinedCalendars(timeSlots: [[Int]]) -> [[Int]] {
    var timeSlots = timeSlots
    timeSlots.sort {
        $0[0] < $1[0]
    }
    var previousTimeSlot = timeSlots[0]
    var combinedSlots: [[Int]] = [timeSlots[0]]
    var index = 1
    var currentTimeSlot: [Int]
    while index < timeSlots.count {
        currentTimeSlot = timeSlots[index]
        if currentTimeSlot[0] > previousTimeSlot[1] {
            previousTimeSlot = currentTimeSlot
            combinedSlots.append(currentTimeSlot)
        } else {
            if currentTimeSlot[0] < previousTimeSlot[0] {
                previousTimeSlot[0] = currentTimeSlot[0]
            }
            if currentTimeSlot[1] > previousTimeSlot[1] {
                previousTimeSlot[1] = currentTimeSlot[1]
            }
            combinedSlots.removeLast()
            combinedSlots.append(previousTimeSlot)

        }
        index += 1
    }
    return combinedSlots
}

var timeSlots = [[0,1],[3,5],[4,8],[10,12],[9,10]]
timeSlots = [[10,12],[6,8],[1,4]]
timeSlots = [[1,10],[2,6],[3,5],[7,9]]
let result = combinedCalendars(timeSlots: timeSlots)