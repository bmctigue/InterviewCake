

protocol NodeProtocol {
    var data: Int { get }
    var leftNode: Node? { get set }
    var rightNode: Node? { get set }
    var deleted: Bool { get set }
    var nodeHeight: Int { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
    func height() -> Int
}

class Node: NodeProtocol {
    var data: Int
    var leftNode: Node?
    var rightNode: Node?
    var deleted: Bool = false
    var nodeHeight: Int = -1
    
    init(data: Int) {
        self.data = data
    }
    
    func find(data: Int) -> Node? {
        if self.data == data && deleted == false {
            return self
        }
        if leftNode != nil && (leftNode?.data)! < data {
            return leftNode!.find(data: data)
        }
        if rightNode != nil {
            return rightNode!.find(data: data)
        }
        return nil
    }
    
    func insert(data: Int) {
        if data > self.data {
            if rightNode == nil {
                rightNode = Node(data: data)
            } else {
                rightNode!.insert(data: data)
            }
        } else {
            if leftNode == nil {
                leftNode = Node(data: data)
            } else {
                leftNode!.insert(data: data)
            }
        }
    }
    
    func delete(data: Int) {
        let node = find(data: data)
        node?.deleted = true
    }
    
    func height() -> Int {
        var leftHeight: Int = -1
        var rightHeight: Int = -1
        if leftNode != nil {
            leftHeight = leftNode!.height()
        }
        if rightNode != nil {
            rightHeight = rightNode!.height()
        }
        self.nodeHeight = max(leftHeight,rightHeight) + 1
//        print("data: \(self.data), height:\(self.nodeHeight)")
        return self.nodeHeight
    }
    
    func unBalanced(level: Int, low: Int, high: Int) -> (Int,Int) {
        var low = low
        var high = high
        var level = level
        
        if leftNode == nil && rightNode == nil {
            if low == 0 {
                low = level
            } else {
                low = level < low ? level : low
            }
            high = level > high ? level : high
            print("node: \(self.data)")
            print("level: \(level)")
            print("low: \(low)")
            print("high: \(high)")
            print("****")
        }
        level += 1
        if leftNode != nil {
            if low != 0 && (high - low) > 1 {
                return (low,high)
            }
            (low,high) = leftNode!.unBalanced(level: level, low: low, high: high)
        }
        if rightNode != nil {
            if low != 0 && (high - low) > 1 {
                return (low,high)
            }
            (low,high) = rightNode!.unBalanced(level: level, low: low, high: high)
        }
        return (low,high)
    }
    
    func valid(valid: Bool, limit: Int) -> (Bool,Int) {
        var valid = valid
        var limit = limit
        
        print("node: \(data)")
        print("limit: \(limit)")
        
        if !valid {
            return (false,limit)
        }
        
        if leftNode == nil && rightNode == nil {
            return (true,limit)
        }
        
        if leftNode != nil {
//            leftNode!.data = leftNode!.data == 10 ? 4 : leftNode!.data
            let maxValidLeft = data <= limit ? leftNode!.data <= limit : leftNode!.data > limit
            if leftNode!.data <= data && maxValidLeft {
                (valid,limit) = leftNode!.valid(valid: valid, limit: limit)
            } else {
                return (false,limit)
            }
        }
        if rightNode != nil {
//            rightNode!.data = rightNode!.data == 3 ? 6 : rightNode!.data
            let maxValidRight = data >= limit ? rightNode!.data > limit : rightNode!.data <= limit
            if rightNode!.data > data && maxValidRight {
                (valid,limit) = rightNode!.valid(valid: valid, limit: limit)
            } else {
                return (false,limit)
            }
        }
        return (valid,limit)
    }
    
    func secondHighest(highest: Int, second: Int) -> (Int,Int) {
        var highest = highest
        var second = second
        
        var items = [second,highest,data]
        items = items.sorted(by: {$0 < $1})
        if items[1] == items.last! {
            second = items.first!
            highest = items[1]
        } else {
            second = items[1]
            highest = items.last!
        }
        
        if rightNode != nil {
            (highest, second) = rightNode!.secondHighest(highest: highest, second: second)
        } else if leftNode != nil {
            (highest, second) = leftNode!.secondHighest(highest: highest, second: second)
        }
        return (highest,second)
    }
}

let node = Node(data: 5)
node.data

protocol BinaryTreeProtocol {
    var root: Node? { get set }
    func find(data: Int) -> Node?
    func delete(data: Int)
    func height(node: Node?) -> Int
    func superBalanced() -> Bool
    func secondHighest() -> Node?
}

struct BinaryTree {
    var root: Node?
    
    init(root: Node?) {
        self.root = root
    }
    
    func find(data: Int) -> Node? {
        return root?.find(data: data)
    }
    
    func insert(data: Int) {
        root?.insert(data: data)
    }
    
    func delete(data: Int) {
        root?.delete(data: data)
    }
    
    func height() -> Int {
        return (root?.height())!
    }
    
    func unBalanced() -> Bool {
        var low = 0
        var high = 0
        (low,high) = (root?.unBalanced(level: 0, low: low, high: high))!
        print("(low,high): \((low,high))")
        return (high - low) > 1
    }
    
    func valid() -> Bool {
        var valid: Bool = true
        var limit = (root?.data)!
        (valid,limit) = (root?.valid(valid: true, limit: limit))!
        return valid
    }
    
    func secondHighest() -> Int {
        var highest: Int = 0
        var second: Int = 0
        if ((root?.rightNode) != nil) {
            (highest,second) = (root?.secondHighest(highest: (root?.rightNode?.data)!, second: (root?.data)!))!
        } else if ((root?.leftNode) != nil) {
            (highest,second) = (root?.secondHighest(highest: (root?.data)!, second: (root?.leftNode?.data)!))!
        }
        return second
    }
}

let tree = BinaryTree(root:node)
tree.insert(data: 2)
tree.insert(data: 1)
tree.insert(data: 3)
tree.insert(data: 4)
tree.insert(data: 8)
tree.insert(data: 9)
tree.insert(data: 13)
tree.insert(data: 10)
tree.insert(data: 12)
tree.insert(data: 14)
tree.secondHighest()

