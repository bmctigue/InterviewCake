//: Playground - noun: a place where people can play

import UIKit

func overlappingRects(rect1:[String:Int], rect2: [String:Int]) -> [String:Int] {
    let xOverlap = overlapX(rect1: rect1, rect2: rect2)
    print("overlapX: \(xOverlap)")
    let yOverlap = overlapY(rect1: rect1, rect2: rect2)
    print("overlapY: \(yOverlap)")
    if xOverlap[1] <= 0 || yOverlap[1] <= 0 {
        return [:]
    }
    return ["left_x": xOverlap[0], "bottom_y": yOverlap[0], "width": xOverlap[1], "height": yOverlap[1]]
}

func overlapX(rect1:[String:Int], rect2: [String:Int]) -> [Int] {
    let left1 = rect1["left_x"]!
    let width1 = rect1["width"]!
    let left2 = rect2["left_x"]!
    let width2 = rect2["width"]!
    return overLap(boundary1: left1, size1: width1, boundary2: left2, size2: width2)
}

func overlapY(rect1:[String:Int], rect2: [String:Int]) -> [Int] {
    let bottom1 = rect1["bottom_y"]!
    let height1 = rect1["height"]!
    let bottom2 = rect2["bottom_y"]!
    let height2 = rect2["height"]!
    return overLap(boundary1: bottom1, size1: height1, boundary2: bottom2, size2: height2)
}

func overLap(boundary1: Int, size1: Int, boundary2: Int, size2: Int) -> [Int] {
    let total1 = boundary1 + size1
    let total2 = boundary2 + size2
    let overlap1 = max(boundary1,boundary2)
    let overlap2 = min(total1,total2)
    let overlapSize = overlap2-overlap1
    return [overlap1,overlapSize]
}

let rect1 = ["left_x": 0, "bottom_y": 0, "width": 10, "height":10]
let rect2 = ["left_x": 5, "bottom_y": 5, "width": 10, "height":10]
let rect = overlappingRects(rect1: rect1, rect2: rect2)
print(rect)

