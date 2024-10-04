import Foundation

class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(value: T) {
        root = insert(node: root, value: value)
    }
    /// 재귀 형태의 insert 함수
    private func insert(node: Node<T>?, value: T) -> Node<T> {
        guard let node else { return Node(value) }
        
        if value < node.value {
            node.left = insert(node: node.left, value: value)
        } else if value > node.value {
            node.right = insert(node: node.right, value: value)
        }
        
        return node
    }
    
    func erase(value: T) {
        root = erase(node: root, value)
    }
    /// 재귀 형태의 erase 함수
    private func erase(node: Node<T>?, _ value: T) -> Node<T>? {
        guard let node else { return nil }
        
        if value < node.value {
            node.left = erase(node: node.left, value)
        } else if value > node.value {
            node.right = erase(node: node.right, value)
        } else {
            if node.left == nil && node.right == nil {
                return nil
            } else if node.left == nil {
                return node.right
            } else if node.right == nil {
                return node.left
            } else {
                let minValue = findMin(node: node.right!)
                node.value = minValue
                node.right = erase(node: node.right, minValue)
            }
        }
        
        return node
    }
    
    func findMin(node: Node<T>) -> T {
        var current = node
        
        while let left = current.left {
            current = left
        }
        
        return current.value
    }
    
    func find(value: T) -> Node<T>? {
        return find(node: root, value: value)
    }
    /// 재귀 형태의 find 함수
    private func find(node: Node<T>?, value: T) -> Node<T>? {
        guard let node else { return nil }
        
        if value == node.value {
            return node
        } else if value < node.value {
            return find(node: node.left, value: value)
        } else {
            return find(node: node.right, value: value)
        }
    }
    
    func update(oldValue: T, newValue: T) -> Bool {
        guard let node = find(value: oldValue) else { return false }
        
        erase(value: oldValue)
        insert(value: newValue)
        return true
    }
    
    func printTree() {
        printTree(node: root, prefix: "", isLeft: true)
    }
    /// 재귀 형태의 printTree 함수
    private func printTree(node: Node<T>?, prefix: String, isLeft: Bool) {
        guard let node else { return }
        
        print("\(prefix)\(isLeft ? "├──" : "└──") \(node.value)")
        
        let newPrefix = prefix + (isLeft ? "│   " : "    ")
        printTree(node: node.left, prefix: newPrefix, isLeft: true)
        printTree(node: node.right, prefix: newPrefix, isLeft: false)
    }
}
