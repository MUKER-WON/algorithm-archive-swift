var arr = [Int]()
var result = 0
for _ in 0..<Int(readLine()!)! {
    arr += [Int(readLine()!)!]
}
arr.sort(by: >)
for i in 0..<arr.count {
    let tip = arr[i]-i
    if tip < 1 { break }
    result += tip
}
print(result)