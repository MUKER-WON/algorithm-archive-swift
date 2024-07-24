func solution(_ elements:[Int]) -> Int {
    var result = [Int]()
    var count = elements.count
    var arr = Array(repeating: 0, count: count)
    for i in 0..<count-1 {
        for j in 0..<count {
            arr[j] += elements[(j+i)%count]
        }
        result.append(contentsOf: arr)
    }
    return Set(result).count+1
}