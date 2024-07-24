func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map {
        let next = ~$0 & ($0+1)
        return ($0 | next) & ~(next >> 1)
    }
}