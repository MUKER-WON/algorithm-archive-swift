import Foundation

func solution(_ operations:[String]) -> [Int] {
    let maxHeap = Heap<Int>.createMaxHeap()
    let minHeap = Heap<Int>.createMinHeap()
    var dic = [Int: Int]()
    
    for operation in operations {
        let parts = operation.split { $0 == " " }.map { String($0) }
        let command = parts[0]
        let value = Int(parts[1])!
        
        switch command {
        case "I":
            maxHeap.insert(value)
            minHeap.insert(value)
            dic[value, default: 0] += 1
            
        case "D":
            if value == 1 {
                while let max = maxHeap.peek,
                      (dic[max] ?? 0) <= 0 {
                    _ = maxHeap.remove()
                }
                
                if let max = maxHeap.remove() {
                    dic[max, default: 0] -= 1
                }
            } else {
                while let min = minHeap.peek,
                      (dic[min] ?? 0) <= 0 {
                    _ = minHeap.remove()
                }
                
                if let min = minHeap.remove() {
                    dic[min, default: 0] -= 1
                }
            }
            
        default:
            break
        }
    }
    
    var maxValue = 0
    var minValue = 0
    
    while let max = maxHeap.peek, (dic[max] ?? 0) <= 0 {
        _ = maxHeap.remove()
    }
    if let max = maxHeap.peek {
        maxValue = max
    }
    
    while let min = minHeap.peek, (dic[min] ?? 0) <= 0 {
        _ = minHeap.remove()
    }
    if let min = minHeap.peek {
        minValue = min
    }
    
    if maxHeap.isEmpty || minHeap.isEmpty {
        return [0,0]
    }
    
    return [maxValue, minValue]
}

class Heap<Element> {
    private var elements = [Element]()
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