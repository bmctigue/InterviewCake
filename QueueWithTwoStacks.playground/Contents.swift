//: Playground - noun: a place where people can play

import UIKit

struct QueueWithTwoStructs {
    
    var inStack: [Int] = []
    var outStack: [Int] = []
    
    mutating func enqueue(item: Int) {
        inStack.append(item)
    }
    
    mutating func dequeue() -> Int? {
        if outStack.isEmpty {
            if inStack.isEmpty {
                return nil
            }
            for _ in inStack {
                outStack.append(inStack.popLast()!)
            }
        }
        return outStack.popLast()
    }
    
}

var queue = QueueWithTwoStructs()
queue.enqueue(item: 1)
queue.enqueue(item: 2)
queue.enqueue(item: 3)
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()