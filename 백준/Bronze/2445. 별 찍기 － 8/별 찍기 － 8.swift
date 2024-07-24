let n = Int(readLine()!)!
var a = Array(repeating: " ", count: n)
for i in 0..<n { a[i] = "*"; print((a+a.reversed()).joined()) }
for i in 0..<n { a[(n-1)-i] = " "; print((a+a.reversed()).joined()) }