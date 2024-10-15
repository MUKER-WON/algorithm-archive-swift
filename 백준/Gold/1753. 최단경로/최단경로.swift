class Heap<T> {
    var arr = [T]()
    let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) { self.sort = sort }
    
    func insert(_ v: T) {
        arr.append(v)
        siftUp(arr.count-1)
    }
    
    func remove() -> T? {
        guard !arr.isEmpty else { return nil }
        arr.swapAt(0, arr.count-1)
        let v = arr.removeLast()
        siftDown(0)
        return v
    }
    
    private func siftUp(_ child: Int) {
        var child = child
        var parent = parentIndex(child)
        
        while child > 0 && sort(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
    
    private func siftDown(_ parent: Int) {
        var parent = parent
        
        while true {
            let leftChild = leftChildIndex(parent)
            let rightChild = rightChildIndex(parent)
            var candidate = leftChild
            
            guard leftChild < arr.count else { break }
            
            if rightChild < arr.count && sort(arr[rightChild], arr[candidate]) {
                candidate = rightChild
            }
            
            if sort(arr[candidate], arr[parent]) {
                arr.swapAt(candidate, parent)
                parent = candidate
            } else {
                break
            }
        }
    }
    
    func parentIndex(_ i: Int) -> Int { (i-1)/2 }
    func leftChildIndex(_ i: Int) -> Int { i*2+1 }
    func rightChildIndex(_ i: Int) -> Int { i*2+2 }
}

let I = readLine()!.split { $0 == " " }.map { Int($0)! }
let (V,E,K) = (I[0],I[1],Int(readLine()!)!)
let INF = Int(1e9)
var graph = [Int: [(Int,Int)]]()
var shortest = Array(repeating: INF, count: V+1); shortest[K] = 0

for _ in 0..<E {
    let I = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (u,v,w) = (I[0],I[1],I[2])
    graph[u, default: []].append((v,w))
}

let heap = Heap<(Int,Int)> { $0.1 < $1.1 }
heap.insert((K,0))

while let (now, value) = heap.remove() {
    if value > shortest[now] { continue }
    if let arr = graph[now] {
        for (next, nextValue) in arr {
            let newValue = value + nextValue
            if newValue < shortest[next] {
                shortest[next] = newValue
                heap.insert((next, newValue))
            }
        }
    }
}

for i in 1...V {
    print(shortest[i] == INF ? "INF": "\(shortest[i])")
}