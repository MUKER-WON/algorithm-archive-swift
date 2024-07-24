func solution(_ arr:[Int]) -> Int {
    let maxNum = arr.max()!
    var result = maxNum
    while true {
        if arr.filter({ result % $0 == 0 }).count == arr.count { break }
        else { result += maxNum }
    }
    return result
}
