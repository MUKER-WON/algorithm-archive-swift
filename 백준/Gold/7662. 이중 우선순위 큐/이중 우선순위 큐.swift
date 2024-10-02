import Foundation

struct Heap<T: Comparable> {
    var nodes = [T]()
    let comparator: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.comparator = sort
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func insert(_ value: T) {
        nodes.append(value)
        siftUp(nodes.count - 1)
    }

    mutating func remove() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        let value = nodes[0]
        nodes[0] = nodes.removeLast()
        siftDown(0)
        return value
    }

    private mutating func siftUp(_ index: Int) {
        var index = index
        while index > 0 {
            let parentIndex = (index - 1) / 2
            if comparator(nodes[index], nodes[parentIndex]) {
                nodes.swapAt(index, parentIndex)
                index = parentIndex
            } else {
                break
            }
        }
    }

    private mutating func siftDown(_ index: Int) {
        var index = index
        let count = nodes.count
        while index < count {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var candidate = index
            if left < count && comparator(nodes[left], nodes[candidate]) {
                candidate = left
            }
            if right < count && comparator(nodes[right], nodes[candidate]) {
                candidate = right
            }
            if candidate == index { return }
            nodes.swapAt(index, candidate)
            index = candidate
        }
    }
}

var maxHeap = Heap<Int>(sort: >)
var minHeap = Heap<Int>(sort: <)
var elementCount = [Int: Int]()

func insert(_ num: Int) {
    maxHeap.insert(num)
    minHeap.insert(num)
    elementCount[num, default: 0] += 1
}

func removeMax() {
    while let maxVal = maxHeap.peek(), elementCount[maxVal] == 0 {
        maxHeap.remove()
    }
    if let maxVal = maxHeap.remove() {
        elementCount[maxVal]! -= 1
    }
}

func removeMin() {
    while let minVal = minHeap.peek(), elementCount[minVal] == 0 {
        minHeap.remove()
    }
    if let minVal = minHeap.remove() {
        elementCount[minVal]! -= 1
    }
}

for _ in 0..<Int(readLine()!)! {
    maxHeap = Heap(sort: >)
    minHeap = Heap(sort: <)
    elementCount.removeAll()
    
    for _ in 0..<Int(readLine()!)! {
        let input = readLine()!.split(separator: " ")
        let command = input[0]
        let num = Int(input[1])!
        
        if command == "I" {
            insert(num)
        } else if num == 1 {
            removeMax()
        } else {
            removeMin()
        }
    }
    
    while let maxVal = maxHeap.peek(), elementCount[maxVal] == 0 {
        maxHeap.remove()
    }
    while let minVal = minHeap.peek(), elementCount[minVal] == 0 {
        minHeap.remove()
    }
    
    if let maxVal = maxHeap.peek(), let minVal = minHeap.peek() {
        print("\(maxVal) \(minVal)")
    } else {
        print("EMPTY")
    }
}