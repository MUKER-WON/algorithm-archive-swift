
import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var list = Array(repeating: [(Int, Int)](), count: N+1)

for _ in 0..<M {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (start, arrive, cost) = (I[0], I[1], I[2])
    list[start].append((arrive, cost))
}

var move = readLine()!.split { $0 == " " }.map { Int($0)! }
var least = Array(repeating: Int.max, count: N+1)
var heap = Heap<(Int, Int)>.init { $0.1 < $1.1 }

least[move[0]] = 0
heap.insert((move[0], 0))

while let (now, value) = heap.remove() {
    
    if now == move[1] {
        least[move[1]] = value
        break
    }
    
    if value > least[now] {
        continue
    }
    
    for (next, nextValue) in list[now] {
        let newValue = value + nextValue
        
        if newValue < least[next] {
            least[next] = newValue
            heap.insert((next, newValue))
        }
    }
}

print(least[move[1]])


class Heap<Element> {
    var elements = [Element]()
    private let sort: (Element, Element) -> Bool
    
    init(
        elements: [Element] = [Element](),
        sort: @escaping (Element, Element) -> Bool
    ) {
        self.elements = elements
        self.sort = sort
        
        if !elements.isEmpty {
            buildHeap()
        }
    }
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Element? {
        return elements.first
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return index * 2 + 2
    }
    
    private func siftDown(_ index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(parent)
            let rightChild = rightChildIndex(parent)
            var candidate = parent
            
            if leftChild < elements.count &&
                sort(elements[leftChild], elements[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < elements.count &&
                sort(elements[rightChild], elements[candidate]) {
                candidate = rightChild
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func siftUp(_ index: Int) {
        var child = index
        var parent = parentIndex(child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
    
    private func buildHeap() {
        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }
    
    func insert(_ element: Element) {
        elements.append(element)
        siftUp(count - 1)
    }
    
    func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        elements.swapAt(0, count - 1)
        let removeElement = elements.removeLast()
        
        if !isEmpty {
            siftDown(0)
        }
        
        return removeElement
    }
}

extension Heap where Element: Comparable {
    static func createMaxHeap(elements: [Element] = []) -> Heap<Element> {
        return Heap(elements: elements, sort: >)
    }
    
    static func createMinHeap(elements: [Element] = []) -> Heap<Element> {
        return Heap(elements: elements, sort: <)
    }
}