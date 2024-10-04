import Foundation

struct Heap<T: Comparable> {
    /// 힙의 요소를 저장하는 배열
    var elements = [T]()
    /// 최대힙, 최소힙을 결정 짓는, 힙의 정렬 기준을 결정하는 클로저
    private let sort: (T, T) -> Bool
    
    var count: Int { return elements.count }
    var peek: T? { return elements.first }
    
    init(
        elements: [T] = [T](),
        sort: @escaping (T, T) -> Bool
    ) {
        self.elements = elements
        self.sort = sort
        
        // 초기 요소가 있다면 힙으로 변환
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(index: i)
            }
        }
    }
    /// 새 요소를 힙에 추가
    mutating func push(_ element: T) {
        elements.append(element)
        siftUp(index: count - 1)
    }
    /// 최상위 요소를 pop 하고 반환
    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        
        let element = elements.removeLast()
        siftDown(index: 0)
        return element
    }
    /// 요소를 위로 이동시켜 힙 속성 유지
    private mutating func siftUp(index: Int) {
        var child = index
        var parent = parentIndex(child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
    /// 요소를 아래로 이동시켜 힙 속성 유지
    private mutating func siftDown(index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(parent)
            let rightChild = rightChildIndex(parent)
            var candidate = parent
            
            if leftChild < count &&
                sort(elements[leftChild], elements[candidate]) {
                candidate = leftChild
            }
            if rightChild < count &&
                sort(elements[rightChild], elements[candidate]) {
                candidate = rightChild
            }
            if candidate == parent { return }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
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
}

var minHeap = Heap<Int>(sort: <) // 최소힙으로 초기화
minHeap.push(27)
minHeap.push(8)
minHeap.push(20)
minHeap.push(16)
minHeap.push(14)
minHeap.push(21)
minHeap.push(12)

print(minHeap.elements) // [8, 14, 12, 27, 16, 21, 20]
print(minHeap.pop()) // pop 8
print(minHeap.elements) // [12, 14, 20, 27, 16, 21]
