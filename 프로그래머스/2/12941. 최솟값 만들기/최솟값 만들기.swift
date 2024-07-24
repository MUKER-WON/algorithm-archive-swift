func solution(_ A:[Int], _ B:[Int]) -> Int {
    let A = A.sorted(by: >)
    let B = B.sorted(by: <)
    var result = Array(repeating: 0, count: A.count)
    for i in 0..<result.count {
        result[i] = A[i] * B[i]
    }
    return result.reduce(0,+)
}