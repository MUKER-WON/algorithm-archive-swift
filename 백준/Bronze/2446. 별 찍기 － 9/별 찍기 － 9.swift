let n = Int(readLine()!)!
var str = Array(repeating: "*", count: n*2-1)
var arr = [str]
for i in 0..<n-1 {
    str[i] = " "
    str[str.count-i-1] = ""
    arr.append(str)
}
arr.forEach { print($0.joined()) }
arr.removeLast()
arr.reversed().forEach { print($0.joined()) }