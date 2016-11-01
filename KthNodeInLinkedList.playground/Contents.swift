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
    
    func kThItem(k: Int) -> Node? {
        
        if k == 0 {
            return nil
        }
        
        var currentNode = head
        var kNode: Node?
        var index = 1
        
        while currentNode.next != nil {
            if index >= k {
                if index == k {
                   kNode = head
                }
                kNode = kNode!.next
            }
            currentNode = currentNode.next!
            index += 1
        }
        if index == k {
            kNode = head
        }
        
        return kNode
    }
    
    func printList() {
        
        var currentNode: Node? = head
        
        while currentNode?.next != nil {
            print(currentNode!.value)
            currentNode = currentNode?.next
        }
        print(currentNode!.value)
        
    }
}

let list = List()
let node: Node? = list.kThItem(k: 3)
node?.value
list.printList()

