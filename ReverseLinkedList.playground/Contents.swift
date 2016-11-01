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
    
    var head: Node
    var a: Node
    var b: Node
    var c: Node
    var d: Node
    
    init() {
        self.a = Node(value: 0)
        self.b = Node(value: 1)
        self.c = Node(value: 2)
        self.d = Node(value: 3)
        self.head = a
        a.next = b
        b.next = c
        c.next = d
    }
    
    func reverse() -> Node {
        
        var previous: Node? = head
        var next: Node? = head.next
        head.next = nil
        
        while next != nil {
            previous = head
            head = next!
            next = head.next
            head.next = previous
        }
        
        return head
    }
    
    func printList() {
        
        var tempNode: Node? = head
        
        while tempNode?.next != nil {
            print(tempNode!.value)
            tempNode = tempNode?.next
        }
        print(tempNode!.value)
        
    }
}

let list = List()
let head = list.reverse()
head.value
list.printList()

