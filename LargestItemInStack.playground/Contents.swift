//: Playground - noun: a place where people can play

import UIKit

struct MaxStack {
    
    var stack: [Int] = []
    var maxStack: [Int] = []
    
    mutating func push(item: Int) {
        stack.append(item)
        if maxStack.last == nil {
            maxStack.append(item)
        } else {
            if item > maxStack.last! {
                maxStack.append(item)
            }
        }
        print("maxStack: \(maxStack)")
    }
    
    mutating func pop() -> Int? {
        if stack.isEmpty {
            return nil
        }
        let topItem: Int? = stack.popLast()
        if topItem == maxStack.last {
            maxStack.popLast()
        }
        print("maxStack: \(maxStack)")
        return topItem
    }
    
    func peek() -> Int? {
        if stack.isEmpty {
            return nil
        }
        return stack.last!
    }
    
    func getMax() -> Int? {
        return maxStack.last
    }
}
var maxStack = MaxStack()
maxStack.push(item: 1)
maxStack.push(item: 4)
maxStack.push(item: 3)
maxStack.getMax()
maxStack.pop()
maxStack.getMax()
maxStack.pop()
maxStack.getMax()