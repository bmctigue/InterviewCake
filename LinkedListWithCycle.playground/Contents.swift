//: Playground - noun: a place where people can play

import UIKit

class Node {
    
    var value: Int = 0
    var next: Node?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
}

class List {
    
    var a: Node
    var b: Node
    var c: Node
    var d: Node
    
    init() {
        self.a = Node(value: 0)
        self.b = Node(value: 1)
        self.c = Node(value: 2)
        self.d = Node(value: 3)
        a.next = b
        b.next = c
        c.next = b
    }
    
    func containsCycle(startingNode: Node) -> Bool {
        var currentNode: Node
        var slowNode: Node?
        
        currentNode = startingNode
        slowNode = startingNode
        var slowIndex = 0
        while currentNode.next != nil {
            if currentNode.next?.value == slowNode?.value {
                return true
            }
            if slowIndex % 2 == 0 {
                slowNode = slowNode?.next
            }
            currentNode = currentNode.next!
            slowIndex += 1
        }
        
        return false
    }
}

let list = List()
list.containsCycle(startingNode: list.a)

