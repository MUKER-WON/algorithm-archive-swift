func solution(_ numbers:[Int]) -> String {
    let temp = numbers.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
    let result = temp.joined()
    if result.first == "0" { return "0" }
    return result
}