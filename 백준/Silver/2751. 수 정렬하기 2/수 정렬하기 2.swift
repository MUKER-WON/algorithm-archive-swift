let T = Int(readLine()!)!
var A = [Int]()
for _ in 1...T {
    A.append(Int(readLine()!)!)
}
for i in A.sorted() {
    print(i)
}
