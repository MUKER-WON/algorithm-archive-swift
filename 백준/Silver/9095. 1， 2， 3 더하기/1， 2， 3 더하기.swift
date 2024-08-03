var a = Array(repeating: 0, count: 12)
a[1] = 1
a[2] = 2
a[3] = 4
for i in 4...11 {
    a[i] = a[i-1] + a[i-2] + a[i-3]
}
for _ in 0..<Int(readLine()!)! {
    print(a[Int(readLine()!)!])
}