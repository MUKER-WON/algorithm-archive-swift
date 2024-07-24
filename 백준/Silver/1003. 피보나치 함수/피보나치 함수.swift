let input = Int(readLine()!)!
var arr: [Int] = Array(repeating: 0, count: 42)
arr[0] = 1
for i in 2...41 {
    arr[i] = arr[i-1] + arr[i-2]
}
for _ in 0..<input {
    let num = Int(readLine()!)!
    if num == 0 { print("1 0") }
    else { print(arr[num], arr[num+1]) }
}