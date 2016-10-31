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
    
    func deleteNode(node: Node) -> Node {
        node.value = (node.next?.value)!
        node.next = node.next?.next
        return node
    }
}

var a = Node(value: 0)
var b = Node(value: 1)
var c = Node(value: 2)

a.next = b
b.next = c

let list = List()
list.deleteNode(node: b)
a.next?.value