let T = Int(readLine()!)!
var A = [String]()
for _ in 1...T {
    A.append(readLine()!)
}
A = Array(Set(A))
A.sort { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }
for i in A {
    print(i)
}