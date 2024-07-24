struct Heap {
    var arr: [Int] = [0]
    
    mutating func insert(n: Int) {
        arr.append(n)
        var numIdx = arr.count-1
        while (numIdx != 1) && (n < arr[numIdx/2]) {
            arr.swapAt(numIdx, numIdx/2)
            numIdx /= 2
        }
    }
    
    mutating func delete() -> Int {
        let len = arr.count-1
        let min = arr[1]
        arr.swapAt(1, len)
        arr.removeLast()
        
        var parent = 1
        while true {
            var child = parent*2
            if child+1 < len && arr[child] > arr[child+1] {
                child += 1
            }
            if child >= len || arr[child] > arr[parent] {
                break
            }
            arr.swapAt(child, parent)
            parent = child
        }
        return min
    }
    func isEmpty() -> Bool {
        return arr.count == 1 ? true : false
    }
}


let N = Int(readLine()!)!
var heap = Heap()

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x == 0 {
        if heap.isEmpty() { print("0") }
        else { print(heap.delete()) } }
    else { heap.insert(n: x) }
}