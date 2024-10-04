import Foundation

struct Heap {
    /// 0: 절대값, 1: 원래값
    var elements = [(Int, Int)]()
    
    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        var index = elements.count - 1
        while index > 0,
              compare(elements[index], elements[(index - 1) / 2]) {
            elements.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    mutating func pop() -> (Int, Int)? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let result = elements.removeLast()
        var index = 0
        while index * 2 + 1 < elements.count {
            var child = index * 2 + 1
            if child + 1 < elements.count,
               compare(elements[child + 1], elements[child]) {
                child += 1
            }
            if compare(elements[index], elements[child]) { break }
            elements.swapAt(index, child)
            index = child
        }
        return result
    }
    
    private func compare(
        _ a: (Int, Int),
        _ b: (Int, Int)
    ) -> Bool {
        return a.0 == b.0 ? a.1 < b.1 : a.0 < b.0
    }
}

var heap = Heap()

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    if n == 0 {
        if let result = heap.pop() {
            print(result.1)
        } else {
            print(0)
        }
    } else {
        heap.push((abs(n), n))
    }
}